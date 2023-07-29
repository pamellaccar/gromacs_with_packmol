/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2019- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */

/*! \internal \file
 *
 * \brief
 * Implements the GridSet class.
 *
 * \author Berk Hess <hess@kth.se>
 * \ingroup module_nbnxm
 */

#include "gmxpre.h"

#include "gridset.h"

#include "gromacs/mdlib/gmx_omp_nthreads.h"
#include "gromacs/mdlib/updategroupscog.h"
#include "gromacs/nbnxm/atomdata.h"
#include "gromacs/utility/fatalerror.h"

namespace Nbnxm
{

//! Returns the number of search grids
static int numGrids(const GridSet::DomainSetup& domainSetup)
{
    // One grid for the test particle, one for the rest
    static constexpr int sc_numGridsForTestParticleInsertion = 2;
    if (domainSetup.doTestParticleInsertion)
    {
        return sc_numGridsForTestParticleInsertion;
    }
    else
    {
        int numGrids = 1;
        for (auto haveDD : domainSetup.haveMultipleDomainsPerDim)
        {
            if (haveDD)
            {
                numGrids *= 2;
            }
        }
        return numGrids;
    }
}

GridSet::DomainSetup::DomainSetup(const PbcType             pbcType,
                                  const bool                doTestParticleInsertion,
                                  const ivec*               numDDCells,
                                  const gmx_domdec_zones_t* ddZones) :
    pbcType(pbcType),
    doTestParticleInsertion(doTestParticleInsertion),
    haveMultipleDomains(numDDCells != nullptr
                        && (*numDDCells)[XX] * (*numDDCells)[YY] * (*numDDCells)[ZZ] > 1),
    zones(ddZones)
{
    for (int d = 0; d < DIM; d++)
    {
        haveMultipleDomainsPerDim[d] = (numDDCells != nullptr && (*numDDCells)[d] > 1);
    }
}

GridSet::GridSet(const PbcType             pbcType,
                 const bool                doTestParticleInsertion,
                 const ivec*               numDDCells,
                 const gmx_domdec_zones_t* ddZones,
                 const PairlistType        pairlistType,
                 const bool                haveFep,
                 const int                 numThreads,
                 gmx::PinningPolicy        pinningPolicy) :
    domainSetup_(pbcType, doTestParticleInsertion, numDDCells, ddZones),
    grids_(numGrids(domainSetup_), Grid(pairlistType, haveFep_)),
    haveFep_(haveFep),
    numRealAtomsLocal_(0),
    numRealAtomsTotal_(0),
    gridWork_(numThreads)
{
    clear_mat(box_);
    changePinningPolicy(&gridSetData_.cells, pinningPolicy);
    changePinningPolicy(&gridSetData_.atomIndices, pinningPolicy);
}

void GridSet::setLocalAtomOrder()
{
    /* Set the atom order for the home cell (index 0) */
    const Nbnxm::Grid& grid = grids_[0];

    int atomIndex = 0;
    for (int cxy = 0; cxy < grid.numColumns(); cxy++)
    {
        const int numAtoms  = grid.numAtomsInColumn(cxy);
        int       cellIndex = grid.firstCellInColumn(cxy) * grid.geometry().numAtomsPerCell;
        for (int i = 0; i < numAtoms; i++)
        {
            gridSetData_.atomIndices[cellIndex] = atomIndex;
            gridSetData_.cells[atomIndex]       = cellIndex;
            atomIndex++;
            cellIndex++;
        }
    }
}

static int getGridOffset(gmx::ArrayRef<const Grid> grids, int gridIndex)
{
    if (gridIndex == 0)
    {
        return 0;
    }
    else
    {
        const Nbnxm::Grid& previousGrid = grids[gridIndex - 1];
        return previousGrid.atomIndexEnd() / previousGrid.geometry().numAtomsPerCell;
    }
}

void GridSet::putOnGrid(const matrix                   box,
                        const int                      gridIndex,
                        const rvec                     lowerCorner,
                        const rvec                     upperCorner,
                        const gmx::UpdateGroupsCog*    updateGroupsCog,
                        const gmx::Range<int>          atomRange,
                        real                           atomDensity,
                        gmx::ArrayRef<const int64_t>   atomInfo,
                        gmx::ArrayRef<const gmx::RVec> x,
                        const int                      numAtomsMoved,
                        const int*                     move,
                        nbnxn_atomdata_t*              nbat)
{
    Nbnxm::Grid& grid               = grids_[gridIndex];
    const int    cellOffset         = getGridOffset(grids_, gridIndex);
    const int    n                  = atomRange.size();
    real         maxAtomGroupRadius = NAN;

    if (gridIndex == 0)
    {
        copy_mat(box, box_);

        numRealAtomsLocal_ = *atomRange.end() - numAtomsMoved;
        /* We assume that nbnxn_put_on_grid is called first
         * for the local atoms (gridIndex=0).
         */
        numRealAtomsTotal_ = *atomRange.end() - numAtomsMoved;

        maxAtomGroupRadius = (updateGroupsCog ? updateGroupsCog->maxUpdateGroupRadius() : 0);

        if (debug)
        {
            fprintf(debug, "natoms_local = %5d atom_density = %5.1f\n", numRealAtomsLocal_, atomDensity);
        }
    }
    else
    {
        const Nbnxm::Grid::Dimensions& dimsGrid0 = grids_[0].dimensions();
        atomDensity                              = dimsGrid0.atomDensity;
        maxAtomGroupRadius                       = dimsGrid0.maxAtomGroupRadius;

        numRealAtomsTotal_ = std::max(numRealAtomsTotal_, *atomRange.end());
    }

    /* We always use the home zone (grid[0]) for setting the cell size,
     * since determining densities for non-local zones is difficult.
     */
    const int ddZone = (domainSetup_.doTestParticleInsertion ? 0 : gridIndex);
    // grid data used in GPU transfers inherits the gridset pinning policy
    auto pinPolicy = gridSetData_.cells.get_allocator().pinningPolicy();
    grid.setDimensions(
            ddZone, n - numAtomsMoved, lowerCorner, upperCorner, atomDensity, maxAtomGroupRadius, haveFep_, pinPolicy);

    for (GridWork& work : gridWork_)
    {
        work.numAtomsPerColumn.resize(grid.numColumns() + 1);
    }

    /* Make space for the new cell indices */
    gridSetData_.cells.resize(*atomRange.end());

    const int nthread = gmx_omp_nthreads_get(ModuleMultiThread::Pairsearch);
    GMX_ASSERT(nthread > 0, "We expect the OpenMP thread count to be set");

#pragma omp parallel for num_threads(nthread) schedule(static)
    for (int thread = 0; thread < nthread; thread++)
    {
        try
        {
            Grid::calcColumnIndices(grid.dimensions(),
                                    updateGroupsCog,
                                    atomRange,
                                    x,
                                    ddZone,
                                    move,
                                    thread,
                                    nthread,
                                    gridSetData_.cells,
                                    gridWork_[thread].numAtomsPerColumn);
        }
        GMX_CATCH_ALL_AND_EXIT_WITH_FATAL_ERROR
    }

    /* Copy the already computed cell indices to the grid and sort, when needed */
    grid.setCellIndices(
            ddZone, cellOffset, &gridSetData_, gridWork_, atomRange, atomInfo, x, numAtomsMoved, nbat);

    if (gridIndex == 0)
    {
        nbat->natoms_local = nbat->numAtoms();
    }
    if (gridIndex == gmx::ssize(grids_) - 1)
    {
        /* We are done setting up all grids, we can resize the force buffers */
        nbat->resizeForceBuffers();
    }

    int maxNumColumns = 0;
    for (int i = 0; i <= gridIndex; i++)
    {
        maxNumColumns = std::max(maxNumColumns, grids_[i].numColumns());
    }
    setNumColumnsMax(maxNumColumns);
}

} // namespace Nbnxm

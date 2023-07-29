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
 * \brief
 * Implements classes from group.h.
 *
 * \author Kevin Boyd <kevin.boyd@uconn.edu>
 * \ingroup module_mdtypes
 */
#include "gmxpre.h"

#include "group.h"

#include "gromacs/utility/exceptions.h"

gmx_ekindata_t::gmx_ekindata_t(int numTempCoupleGroups, real cos_accel, int numThreads) :
    ngtc(numTempCoupleGroups), nthreads_(numThreads)
{
    tcstat.resize(ngtc);
    /* Set Berendsen tcoupl lambda's to 1,
     * so runs without Berendsen coupling are not affected.
     */
    for (int i = 0; i < ngtc; i++)
    {
        tcstat[i].lambda         = 1.0;
        tcstat[i].vscale_nhc     = 1.0;
        tcstat[i].ekinscaleh_nhc = 1.0;
        tcstat[i].ekinscalef_nhc = 1.0;
    }

    snew(ekin_work_alloc, nthreads_);
    snew(ekin_work, nthreads_);
    snew(dekindl_work, nthreads_);

#pragma omp parallel for num_threads(nthreads_) schedule(static)
    for (int thread = 0; thread < nthreads_; thread++)
    {
        try
        {
            constexpr int EKIN_WORK_BUFFER_SIZE = 2;
            /* Allocate 2 extra elements on both sides, so in single
             * precision we have
             * EKIN_WORK_BUFFER_SIZE*DIM*DIM*sizeof(real) = 72/144 bytes
             * buffer on both sides to avoid cache pollution.
             */
            snew(ekin_work_alloc[thread], ngtc + 2 * EKIN_WORK_BUFFER_SIZE);
            ekin_work[thread] = ekin_work_alloc[thread] + EKIN_WORK_BUFFER_SIZE;
            /* Nasty hack so we can have the per-thread accumulation
             * variable for dekindl in the same thread-local cache lines
             * as the per-thread accumulation tensors for ekin[fh],
             * because they are accumulated in the same loop. */
            dekindl_work[thread] = &(ekin_work[thread][ngtc][0][0]);
        }
        GMX_CATCH_ALL_AND_EXIT_WITH_FATAL_ERROR
    }

    cosacc.cos_accel = cos_accel;
}

gmx_ekindata_t::~gmx_ekindata_t()
{
    for (int i = 0; i < nthreads_; i++)
    {
        sfree(ekin_work_alloc[i]);
    }
    sfree(ekin_work_alloc);
    sfree(ekin_work);
    sfree(dekindl_work);
}

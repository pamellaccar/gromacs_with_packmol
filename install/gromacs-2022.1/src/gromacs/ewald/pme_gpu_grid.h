/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2021- The GROMACS Authors
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
 * \brief Implements PME halo exchange and PME-FFT grid conversion functions.
 *
 * \author Gaurav Garg <gaugarg@nvidia.com>
 *
 * \ingroup module_ewald
 */
#ifndef GMX_EWALD_PME_GPU_GRID_H
#define GMX_EWALD_PME_GPU_GRID_H

struct PmeGpu;
typedef struct gmx_parallel_3dfft* gmx_parallel_3dfft_t;

/*! \libinternal \brief
 * Grid Halo exchange after PME spread
 * ToDo: Current implementation transfers halo region from/to only immediate neighbours
 * And, expects that overlapSize <= local grid width.
 * Implement exchange with multiple neighbors to remove this limitation
 *
 * \param[in]  pmeGpu                 The PME GPU structure.
 */
void pmeGpuGridHaloExchange(const PmeGpu* pmeGpu);

/*! \libinternal \brief
 * Grid reverse Halo exchange before PME gather
 * ToDo: Current implementation transfers halo region from/to only immediate neighbours
 * And, expects that overlapSize <= local grid width.
 * Implement exchange with multiple neighbors to remove this limitation
 *
 * \param[in]  pmeGpu                 The PME GPU structure.
 */
void pmeGpuGridHaloExchangeReverse(const PmeGpu* pmeGpu);

/*! \libinternal \brief
 * Copy PME Grid with overlap region to FFT grid and vice-versa
 *
 * \param[in]  pmeGpu                 The PME GPU structure.
 * \param[in]  h_grid                 FFT grid on host
 * \param[in]  fftSetup               Host FFT setup structure
 * \param[in]  gridIndex              Grid index which is to be converted
 *
 * \tparam  pmeToFft                  A boolean which tells if this is conversion from PME grid to FFT grid or reverse
 */
template<bool pmetofft>
void convertPmeGridToFftGrid(const PmeGpu* pmeGpu, float* h_grid, gmx_parallel_3dfft_t* fftSetup, int gridIndex);

extern template void convertPmeGridToFftGrid<true>(const PmeGpu* /*pmeGpu*/,
                                                   float* /*h_grid*/,
                                                   gmx_parallel_3dfft_t* /*fftSetup*/,
                                                   int /*gridIndex*/);

extern template void convertPmeGridToFftGrid<false>(const PmeGpu* /*pmeGpu*/,
                                                    float* /*h_grid*/,
                                                    gmx_parallel_3dfft_t* /*fftSetup*/,
                                                    int /*gridIndex*/);

#endif

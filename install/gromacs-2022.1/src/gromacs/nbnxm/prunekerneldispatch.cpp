/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2016- The GROMACS Authors
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

#include "gmxpre.h"

#include "gromacs/mdlib/gmx_omp_nthreads.h"
#include "gromacs/nbnxm/nbnxm.h"
#include "gromacs/timing/wallcycle.h"
#include "gromacs/utility/gmxassert.h"

#include "clusterdistancekerneltype.h"
#include "nbnxm_gpu.h"
#include "nbnxm_simd.h"
#include "pairlistset.h"
#include "pairlistsets.h"
#include "kernels_reference/kernel_ref_prune.h"
#include "kernels_simd_2xmm/kernel_prune.h"
#include "kernels_simd_4xm/kernel_prune.h"

void PairlistSets::dispatchPruneKernel(const gmx::InteractionLocality iLocality,
                                       const nbnxn_atomdata_t*        nbat,
                                       gmx::ArrayRef<const gmx::RVec> shift_vec)
{
    pairlistSet(iLocality).dispatchPruneKernel(nbat, shift_vec);
}

void PairlistSet::dispatchPruneKernel(const nbnxn_atomdata_t* nbat, gmx::ArrayRef<const gmx::RVec> shift_vec)
{
    const real rlistInner = params_.rlistInner;

    GMX_ASSERT(cpuLists_[0].ciOuter.size() >= cpuLists_[0].ci.size(),
               "Here we should either have an empty ci list or ciOuter should be >= ci");

    int gmx_unused nthreads = gmx_omp_nthreads_get(ModuleMultiThread::Nonbonded);
    GMX_ASSERT(nthreads == static_cast<gmx::index>(cpuLists_.size()),
               "The number of threads should match the number of lists");
#pragma omp parallel for schedule(static) num_threads(nthreads)
    for (int i = 0; i < nthreads; i++)
    {
        NbnxnPairlistCpu* nbl = &cpuLists_[i];

        switch (getClusterDistanceKernelType(params_.pairlistType, *nbat))
        {
#ifdef GMX_NBNXN_SIMD_4XN
            case ClusterDistanceKernelType::CpuSimd_4xM:
                nbnxn_kernel_prune_4xn(nbl, nbat, shift_vec, rlistInner);
                break;
#endif
#ifdef GMX_NBNXN_SIMD_2XNN
            case ClusterDistanceKernelType::CpuSimd_2xMM:
                nbnxn_kernel_prune_2xnn(nbl, nbat, shift_vec, rlistInner);
                break;
#endif
            case ClusterDistanceKernelType::CpuPlainC:
                nbnxn_kernel_prune_ref(nbl, nbat, shift_vec, rlistInner);
                break;
            default: GMX_RELEASE_ASSERT(false, "kernel type not handled (yet)");
        }
    }
}

void nonbonded_verlet_t::dispatchPruneKernelCpu(const gmx::InteractionLocality iLocality,
                                                gmx::ArrayRef<const gmx::RVec> shift_vec) const
{
    pairlistSets_->dispatchPruneKernel(iLocality, nbat.get(), shift_vec);
}

void nonbonded_verlet_t::dispatchPruneKernelGpu(int64_t step)
{
    wallcycle_start_nocount(wcycle_, WallCycleCounter::LaunchGpu);
    wallcycle_sub_start_nocount(wcycle_, WallCycleSubCounter::LaunchGpuNonBonded);

    const bool stepIsEven =
            (pairlistSets().numStepsWithPairlist(step) % (2 * pairlistSets().params().mtsFactor) == 0);

    Nbnxm::gpu_launch_kernel_pruneonly(
            gpu_nbv,
            stepIsEven ? gmx::InteractionLocality::Local : gmx::InteractionLocality::NonLocal,
            pairlistSets().params().numRollingPruningParts);

    wallcycle_sub_stop(wcycle_, WallCycleSubCounter::LaunchGpuNonBonded);
    wallcycle_stop(wcycle_, WallCycleCounter::LaunchGpu);
}

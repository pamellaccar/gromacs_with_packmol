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
 * \brief Implements Leap-Frog using CUDA
 *
 * This file contains backend-agnostic code for Leap-Frog integrator class on GPU,
 * including class initialization, and data-structures management.
 *
 * \author Artem Zhmurov <zhmurov@gmail.com>
 *
 * \ingroup module_mdlib
 */
#include "gmxpre.h"

#include "leapfrog_gpu.h"

#include <assert.h>
#include <stdio.h>

#include <algorithm>
#include <cmath>

#include "gromacs/gpu_utils/devicebuffer.h"
#include "gromacs/math/vec.h"
#include "gromacs/mdlib/leapfrog_gpu_internal.h"
#include "gromacs/mdtypes/group.h"
#include "gromacs/pbcutil/pbc.h"
#include "gromacs/utility/arrayref.h"

namespace gmx
{

void LeapFrogGpu::integrate(DeviceBuffer<Float3>              d_x,
                            DeviceBuffer<Float3>              d_xp,
                            DeviceBuffer<Float3>              d_v,
                            const DeviceBuffer<Float3>        d_f,
                            const float                       dt,
                            const bool                        doTemperatureScaling,
                            gmx::ArrayRef<const t_grp_tcstat> tcstat,
                            const bool                        doParrinelloRahman,
                            const float                       dtPressureCouple,
                            const matrix                      prVelocityScalingMatrix)
{
    GMX_ASSERT(numAtoms_ > 0, "The number of atoms needs to be >0.");

    if (doTemperatureScaling)
    {
        GMX_ASSERT(checkDeviceBuffer(d_lambdas_, numTempScaleValues_),
                   "Number of temperature scaling factors changed since it was set for the "
                   "last time.");
        GMX_ASSERT(numTempScaleValues_ == ssize(h_lambdas_),
                   "Number of temperature scaling factors changed since it was set for the "
                   "last time.");

        /* In SYCL, we could use host accessors here, without h_lambdas_.
         * According to a quick test, host accessor is slightly faster when using DPC++ and
         * LevelZero compared to using h_lambdas_ + cgh.copy. But with DPC++ and OpenCL, the host
         * accessor waits for fReadyOnDevice in UpdateConstrainGpu::Impl::integrate. See #4023. */
        for (int i = 0; i < numTempScaleValues_; i++)
        {
            h_lambdas_[i] = tcstat[i].lambda;
        }
        copyToDeviceBuffer(&d_lambdas_,
                           h_lambdas_.data(),
                           0,
                           numTempScaleValues_,
                           deviceStream_,
                           GpuApiCallBehavior::Async,
                           nullptr);
    }
    VelocityScalingType prVelocityScalingType = VelocityScalingType::None;
    if (doParrinelloRahman)
    {
        prVelocityScalingType = VelocityScalingType::Diagonal;
        GMX_ASSERT(prVelocityScalingMatrix[YY][XX] == 0 && prVelocityScalingMatrix[ZZ][XX] == 0
                           && prVelocityScalingMatrix[ZZ][YY] == 0 && prVelocityScalingMatrix[XX][YY] == 0
                           && prVelocityScalingMatrix[XX][ZZ] == 0 && prVelocityScalingMatrix[YY][ZZ] == 0,
                   "Fully anisotropic Parrinello-Rahman pressure coupling is not yet supported "
                   "in GPU version of Leap-Frog integrator.");
        prVelocityScalingMatrixDiagonal_ = Float3{ dtPressureCouple * prVelocityScalingMatrix[XX][XX],
                                                   dtPressureCouple * prVelocityScalingMatrix[YY][YY],
                                                   dtPressureCouple * prVelocityScalingMatrix[ZZ][ZZ] };
    }

    launchLeapFrogKernel(numAtoms_,
                         d_x,
                         d_xp,
                         d_v,
                         d_f,
                         d_inverseMasses_,
                         dt,
                         doTemperatureScaling,
                         numTempScaleValues_,
                         d_tempScaleGroups_,
                         d_lambdas_,
                         prVelocityScalingType,
                         prVelocityScalingMatrixDiagonal_,
                         deviceStream_);
}

LeapFrogGpu::LeapFrogGpu(const DeviceContext& deviceContext,
                         const DeviceStream&  deviceStream,
                         const int            numTempScaleValues) :
    deviceContext_(deviceContext), deviceStream_(deviceStream), numTempScaleValues_(numTempScaleValues)
{
    numAtoms_ = 0;

    changePinningPolicy(&h_lambdas_, gmx::PinningPolicy::PinnedIfSupported);

    // If the temperature coupling is enabled, we need to make space for scaling factors
    if (numTempScaleValues_ > 0)
    {
        h_lambdas_.resize(numTempScaleValues_);
        reallocateDeviceBuffer(
                &d_lambdas_, numTempScaleValues_, &numLambdas_, &numLambdasAlloc_, deviceContext_);
    }
}

LeapFrogGpu::~LeapFrogGpu()
{
    freeDeviceBuffer(&d_inverseMasses_);
}

void LeapFrogGpu::set(const int numAtoms, const real* inverseMasses, const unsigned short* tempScaleGroups)
{
    numAtoms_ = numAtoms;

    reallocateDeviceBuffer(
            &d_inverseMasses_, numAtoms_, &numInverseMasses_, &numInverseMassesAlloc_, deviceContext_);
    copyToDeviceBuffer(
            &d_inverseMasses_, inverseMasses, 0, numAtoms_, deviceStream_, GpuApiCallBehavior::Sync, nullptr);

    // Temperature scale group map only used if there are more than one group
    if (numTempScaleValues_ > 1)
    {
        reallocateDeviceBuffer(
                &d_tempScaleGroups_, numAtoms_, &numTempScaleGroups_, &numTempScaleGroupsAlloc_, deviceContext_);
        copyToDeviceBuffer(
                &d_tempScaleGroups_, tempScaleGroups, 0, numAtoms_, deviceStream_, GpuApiCallBehavior::Sync, nullptr);
    }
}

} // namespace gmx

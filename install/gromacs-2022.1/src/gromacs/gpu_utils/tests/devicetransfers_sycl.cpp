/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2020- The GROMACS Authors
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
 * \brief Defines helper functionality for device transfers for tests
 * for GPU host allocator.
 *
 * \author Andrey Alekseenko <al42and@gmail.com>
 */
#include "gmxpre.h"

#include "gromacs/gpu_utils/gmxsycl.h"
#include "gromacs/hardware/device_information.h"
#include "gromacs/utility/arrayref.h"
#include "gromacs/utility/exceptions.h"
#include "gromacs/utility/gmxassert.h"
#include "gromacs/utility/stringutil.h"

#include "devicetransfers.h"

namespace gmx
{

void doDeviceTransfers(const DeviceInformation& deviceInfo, ArrayRef<const char> input, ArrayRef<char> output)
{
    GMX_RELEASE_ASSERT(input.size() == output.size(), "Input and output must have matching size");

    try
    {
        sycl::queue syclQueue(deviceInfo.syclDevice);

        sycl::property_list syclBufferProperties{ sycl::property::buffer::context_bound(
                syclQueue.get_context()) };

        sycl::buffer<char> syclBuffer(sycl::range<1>(input.size()), syclBufferProperties);

        syclQueue
                .submit([&](sycl::handler& cgh) {
                    auto accessor = syclBuffer.get_access(cgh, sycl::write_only, sycl::no_init);
                    cgh.copy(input.data(), accessor);
                })
                .wait_and_throw();

        syclQueue
                .submit([&](sycl::handler& cgh) {
                    auto accessor = syclBuffer.get_access(cgh, sycl::read_only);
                    cgh.copy(accessor, output.data());
                })
                .wait_and_throw();
    }
    catch (sycl::exception& e)
    {
        GMX_THROW(InternalError(
                formatString("Failure while checking data transfer, error was %s", e.what())));
    }
}

} // namespace gmx

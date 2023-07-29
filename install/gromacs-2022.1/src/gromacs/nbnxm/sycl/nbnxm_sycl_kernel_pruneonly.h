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
 * \brief
 * Declares nbnxn sycl helper functions
 *
 * \ingroup module_nbnxm
 */
#ifndef GMX_NBNXM_SYCL_NBNXM_SYCL_KERNEL_PRUNEONLY_H
#define GMX_NBNXM_SYCL_NBNXM_SYCL_KERNEL_PRUNEONLY_H

// Forward declarations
namespace gmx
{
enum class InteractionLocality;
}
struct NbnxmGpu;

namespace Nbnxm
{
using gmx::InteractionLocality;

/*! \brief Launch SYCL NBNXM prune-only kernel.
 *
 * \param nb Non-bonded parameters.
 * \param iloc Interaction locality.
 * \param numParts Total number of rolling-prune parts.
 * \param part Number of the part to prune.
 * \param numSciInPart Number of superclusters in \p part.
 */
void launchNbnxmKernelPruneOnly(NbnxmGpu*                 nb,
                                const InteractionLocality iloc,
                                const int                 numParts,
                                const int                 part,
                                const int                 numSciInPart);

} // namespace Nbnxm

#endif // GMX_NBNXM_SYCL_NBNXM_SYCL_KERNEL_PRUNEONLY_H

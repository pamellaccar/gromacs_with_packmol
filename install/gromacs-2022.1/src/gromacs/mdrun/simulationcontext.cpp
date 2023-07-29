/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2018- The GROMACS Authors
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

#include "simulationcontext.h"

#include "config.h"

#include <cassert>

#include "gromacs/mdrunutility/multisim.h"
#include "gromacs/utility/gmxassert.h"
#include "gromacs/utility/gmxmpi.h"

#include "runner.h"

namespace gmx
{
//! \cond libapi
SimulationContext::SimulationContext(MPI_Comm                    communicator,
                                     ArrayRef<const std::string> multiSimDirectoryNames) :
    libraryWorldCommunicator_(communicator)
{
    GMX_RELEASE_ASSERT((GMX_LIB_MPI && (communicator != MPI_COMM_NULL))
                               || (!GMX_LIB_MPI && (communicator == MPI_COMM_NULL)),
                       "With real MPI, a non-null communicator is required. "
                       "Without it, the communicator must be null.");
    if (multiSimDirectoryNames.empty())
    {
        simulationCommunicator_ = communicator;
    }
    else
    {
        multiSimulation_ = buildMultiSimulation(communicator, multiSimDirectoryNames);
        // Use the communicator resulting from the split for the multi-simulation.
        simulationCommunicator_ = multiSimulation_->simulationComm_;
    }
}

//! \endcond
} // end namespace gmx

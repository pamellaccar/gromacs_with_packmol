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
 * \brief Implements class which recieves coordinates to GPU memory on PME task using CUDA
 *
 *
 * \author Alan Gray <alang@nvidia.com>
 *
 * \ingroup module_ewald
 */
#include "gmxpre.h"

#include "gromacs/ewald/pme_pp_communication.h"
#include "pme_coordinate_receiver_gpu_impl.h"

#include "config.h"

#include "gromacs/ewald/pme_force_sender_gpu.h"
#include "gromacs/gpu_utils/cudautils.cuh"
#include "gromacs/gpu_utils/gpueventsynchronizer.h"
#include "gromacs/utility/gmxmpi.h"

namespace gmx
{

PmeCoordinateReceiverGpu::Impl::Impl(MPI_Comm                     comm,
                                     const DeviceContext&         deviceContext,
                                     gmx::ArrayRef<const PpRanks> ppRanks) :
    comm_(comm),
#if GMX_MPI
    requests_(ppRanks.size(), MPI_REQUEST_NULL),
#else
    requests_(),
#endif
    deviceContext_(deviceContext)
{
    // Create streams to manage pipelining
    ppCommManagers_.reserve(ppRanks.size());
    for (const auto& ppRank : ppRanks)
    {
        ppCommManagers_.emplace_back(PpCommManager{
                ppRank,
                std::make_unique<DeviceStream>(deviceContext_, DeviceStreamPriority::High, false),
                nullptr,
                { 0, 0 } });
    }
}

PmeCoordinateReceiverGpu::Impl::~Impl() = default;

void PmeCoordinateReceiverGpu::Impl::reinitCoordinateReceiver(DeviceBuffer<RVec> d_x)
{
#if GMX_MPI
    int indEnd = 0;
    for (auto& ppCommManager : ppCommManagers_)
    {
        int indStart = indEnd;
        indEnd       = indStart + ppCommManager.ppRank.numAtoms;

        ppCommManager.atomRange = std::make_tuple(indStart, indEnd);

        // Need to send address to PP rank only for thread-MPI as PP rank pushes data using cudamemcpy
        // Skip receiving x buffer pointer when the PP domain is empty (the matching call in `pmePpCommGpu->reinit(n)` is also conditional)
        if (GMX_THREAD_MPI && (ppCommManager.ppRank.numAtoms > 0))
        {
            // Data will be transferred directly from GPU.
            void* sendBuf = reinterpret_cast<void*>(&d_x[indStart]);
            MPI_Send(&sendBuf, sizeof(void**), MPI_BYTE, ppCommManager.ppRank.rankId, 0, comm_);
        }
    }
#else
    GMX_UNUSED_VALUE(d_x);
#endif
}

/*! \brief Receive coordinate synchronizer pointer from the PP ranks. */
void PmeCoordinateReceiverGpu::Impl::receiveCoordinatesSynchronizerFromPpCudaDirect(int ppRank)
{
    GMX_ASSERT(GMX_THREAD_MPI,
               "receiveCoordinatesSynchronizerFromPpCudaDirect is expected to be called only for "
               "Thread-MPI");

    // Data will be pushed directly from PP task

#if GMX_MPI
    // Receive event from PP task
    MPI_Irecv(&ppCommManagers_[ppRank].sync,
              sizeof(GpuEventSynchronizer*), // NOLINT(bugprone-sizeof-expression)
              MPI_BYTE,
              ppRank,
              0,
              comm_,
              &(requests_[ppRank]));
#else
    GMX_UNUSED_VALUE(ppRank);
#endif
}

/*! \brief Receive coordinate data using GPU-aware MPI */
void PmeCoordinateReceiverGpu::Impl::launchReceiveCoordinatesFromPpCudaMpi(DeviceBuffer<RVec> recvbuf,
                                                                           int numAtoms,
                                                                           int numBytes,
                                                                           int ppRank,
                                                                           int senderIndex)
{
    GMX_ASSERT(GMX_LIB_MPI,
               "launchReceiveCoordinatesFromPpCudaMpi is expected to be called only for Lib-MPI");

#if GMX_MPI
    MPI_Irecv(&recvbuf[numAtoms], numBytes, MPI_BYTE, ppRank, eCommType_COORD_GPU, comm_, &(requests_[senderIndex]));
#else
    GMX_UNUSED_VALUE(recvbuf);
    GMX_UNUSED_VALUE(numAtoms);
    GMX_UNUSED_VALUE(numBytes);
    GMX_UNUSED_VALUE(ppRank);
    GMX_UNUSED_VALUE(senderIndex);
#endif
}

int PmeCoordinateReceiverGpu::Impl::synchronizeOnCoordinatesFromPpRank(int pipelineStage,
                                                                       const DeviceStream& deviceStream)
{
#if GMX_MPI
    int senderRank = -1; // Rank of PP task that is associated with this invocation.
#    if (!GMX_THREAD_MPI)
    // Wait on data from any one of the PP sender GPUs
    MPI_Waitany(requests_.size(), requests_.data(), &senderRank, MPI_STATUS_IGNORE);
    GMX_ASSERT(senderRank >= 0, "Rank of sending PP task must be 0 or greater");
    GMX_UNUSED_VALUE(pipelineStage);
    GMX_UNUSED_VALUE(deviceStream);
#    else
    // MPI_Waitany is not available in thread-MPI. However, the
    // MPI_Wait here is not associated with data but is host-side
    // scheduling code to receive a CUDA event, and will be executed
    // in advance of the actual data transfer. Therefore we can
    // receive in order of pipeline stage, still allowing the
    // scheduled GPU-direct comms to initiate out-of-order in their
    // respective streams. For cases with CPU force computations, the
    // scheduling is less asynchronous (done on a per-step basis), so
    // host-side improvements should be investigated as tracked in
    // issue #4047
    senderRank = pipelineStage;
    MPI_Wait(&(requests_[senderRank]), MPI_STATUS_IGNORE);
    ppCommManagers_[senderRank].sync->enqueueWaitEvent(deviceStream);
#    endif
    return senderRank;
#else
    GMX_UNUSED_VALUE(pipelineStage);
    GMX_UNUSED_VALUE(deviceStream);
    return -1;
#endif
}

void PmeCoordinateReceiverGpu::Impl::synchronizeOnCoordinatesFromAllPpRanks(const DeviceStream& deviceStream)
{
    for (int i = 0; i < static_cast<int>(ppCommManagers_.size()); i++)
    {
        if (ppCommManagers_[i].ppRank.numAtoms > 0)
        {
            synchronizeOnCoordinatesFromPpRank(i, deviceStream);
        }
    }
}
DeviceStream* PmeCoordinateReceiverGpu::Impl::ppCommStream(int senderIndex)
{
    return ppCommManagers_[senderIndex].stream.get();
}

std::tuple<int, int> PmeCoordinateReceiverGpu::Impl::ppCommAtomRange(int senderIndex)
{
    return ppCommManagers_[senderIndex].atomRange;
}

int PmeCoordinateReceiverGpu::Impl::ppCommNumSenderRanks()
{
    return ppCommManagers_.size();
}

PmeCoordinateReceiverGpu::PmeCoordinateReceiverGpu(MPI_Comm               comm,
                                                   const DeviceContext&   deviceContext,
                                                   gmx::ArrayRef<PpRanks> ppRanks) :
    impl_(new Impl(comm, deviceContext, ppRanks))
{
}

PmeCoordinateReceiverGpu::~PmeCoordinateReceiverGpu() = default;

void PmeCoordinateReceiverGpu::reinitCoordinateReceiver(DeviceBuffer<RVec> d_x)
{
    impl_->reinitCoordinateReceiver(d_x);
}

void PmeCoordinateReceiverGpu::receiveCoordinatesSynchronizerFromPpCudaDirect(int ppRank)
{
    impl_->receiveCoordinatesSynchronizerFromPpCudaDirect(ppRank);
}

void PmeCoordinateReceiverGpu::launchReceiveCoordinatesFromPpCudaMpi(DeviceBuffer<RVec> recvbuf,
                                                                     int                numAtoms,
                                                                     int                numBytes,
                                                                     int                ppRank,
                                                                     int                senderIndex)
{
    impl_->launchReceiveCoordinatesFromPpCudaMpi(recvbuf, numAtoms, numBytes, ppRank, senderIndex);
}

int PmeCoordinateReceiverGpu::synchronizeOnCoordinatesFromPpRank(int                 senderIndex,
                                                                 const DeviceStream& deviceStream)
{
    return impl_->synchronizeOnCoordinatesFromPpRank(senderIndex, deviceStream);
}

void PmeCoordinateReceiverGpu::synchronizeOnCoordinatesFromAllPpRanks(const DeviceStream& deviceStream)
{
    impl_->synchronizeOnCoordinatesFromAllPpRanks(deviceStream);
}

DeviceStream* PmeCoordinateReceiverGpu::ppCommStream(int senderIndex)
{
    return impl_->ppCommStream(senderIndex);
}

std::tuple<int, int> PmeCoordinateReceiverGpu::ppCommAtomRange(int senderIndex)
{
    return impl_->ppCommAtomRange(senderIndex);
}

int PmeCoordinateReceiverGpu::ppCommNumSenderRanks()
{
    return impl_->ppCommNumSenderRanks();
}


} // namespace gmx

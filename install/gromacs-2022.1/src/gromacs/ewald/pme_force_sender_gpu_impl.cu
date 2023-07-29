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
 * \brief Implements PME-PP communication using CUDA
 *
 *
 * \author Alan Gray <alang@nvidia.com>
 *
 * \ingroup module_ewald
 */
#include "gmxpre.h"

#include "pme_force_sender_gpu_impl.h"

#include "config.h"

#include "gromacs/gpu_utils/cudautils.cuh"
#include "gromacs/gpu_utils/gpueventsynchronizer.h"
#include "gromacs/utility/gmxmpi.h"

namespace gmx
{

/*! \brief Create PME-PP GPU communication object */
PmeForceSenderGpu::Impl::Impl(GpuEventSynchronizer*  pmeForcesReady,
                              MPI_Comm               comm,
                              const DeviceContext&   deviceContext,
                              gmx::ArrayRef<PpRanks> ppRanks) :
    pmeForcesReady_(pmeForcesReady),
    comm_(comm),
    ppRanks_(ppRanks),
    ppCommStream_(ppRanks.size()),
    ppCommEvent_(ppRanks.size()),
    ppCommEventRecorded_(ppRanks.size()),
    deviceContext_(deviceContext),
    pmeRemoteCpuForcePtr_(ppRanks.size()),
    pmeRemoteGpuForcePtr_(ppRanks.size())
{
    // Create streams and events to manage pushing of force buffers to remote PP ranks
    std::unique_ptr<DeviceStream>         stream;
    std::unique_ptr<GpuEventSynchronizer> event;
    size_t                                i = 0;
    for (i = 0; i < ppRanks_.size(); i++)
    {
        stream = std::make_unique<DeviceStream>(deviceContext_, DeviceStreamPriority::High, false);
        ppCommStream_[i] = std::move(stream);
        event            = std::make_unique<GpuEventSynchronizer>();
        ppCommEvent_[i]  = std::move(event);
    }
    stageThreadMpiGpuCpuComm_ = (getenv("GMX_ENABLE_STAGED_GPU_TO_CPU_PMEPP_COMM") != nullptr);
}

PmeForceSenderGpu::Impl::~Impl() = default;

/*! \brief Sets location of force to be sent to each PP rank  */
void PmeForceSenderGpu::Impl::setForceSendBuffer(DeviceBuffer<Float3> d_f)
{

    // Need to send address to PP rank only for thread-MPI as PP rank pulls
    // data using cudamemcpy
    if (!GMX_THREAD_MPI)
    {
        return;
    }

#if GMX_MPI

    if (localForcePtr_.empty())
    {
        localForcePtr_.resize(ppRanks_.size());
    }
    int ind_start = 0;
    int ind_end   = 0;
    int i         = 0;
    for (const auto& receiver : ppRanks_)
    {
        ind_start = ind_end;
        ind_end   = ind_start + receiver.numAtoms;

        if (receiver.numAtoms > 0)
        {
            localForcePtr_[i] = &d_f[ind_start];
            // NOLINTNEXTLINE(bugprone-sizeof-expression)
            MPI_Recv(&pmeRemoteGpuForcePtr_[i], sizeof(float3*), MPI_BYTE, receiver.rankId, 0, comm_, MPI_STATUS_IGNORE);
            // NOLINTNEXTLINE(bugprone-sizeof-expression)
            MPI_Recv(&pmeRemoteCpuForcePtr_[i], sizeof(float3*), MPI_BYTE, receiver.rankId, 0, comm_, MPI_STATUS_IGNORE);
            // Send address of event and associated flag to PP rank, to allow remote enqueueing
            // NOLINTNEXTLINE(bugprone-sizeof-expression)
            MPI_Send(&ppCommEvent_[i], sizeof(GpuEventSynchronizer*), MPI_BYTE, receiver.rankId, 0, comm_);

            std::atomic<bool>* tmpPpCommEventRecordedPtr =
                    reinterpret_cast<std::atomic<bool>*>(&(ppCommEventRecorded_[i]));
            tmpPpCommEventRecordedPtr->store(false, std::memory_order_release);
            // NOLINTNEXTLINE(bugprone-sizeof-expression)
            MPI_Send(&tmpPpCommEventRecordedPtr, sizeof(std::atomic<bool>*), MPI_BYTE, receiver.rankId, 0, comm_);
        }
        i++;
    }

#else
    GMX_UNUSED_VALUE(d_f);
#endif
}


/*! \brief Send PME synchronizer directly using CUDA memory copy */
void PmeForceSenderGpu::Impl::sendFToPpCudaDirect(int ppRank, int numAtoms, bool sendForcesDirectToPpGpu)
{

    GMX_ASSERT(GMX_THREAD_MPI, "sendFToPpCudaDirect is expected to be called only for Thread-MPI");


#if GMX_MPI
    float3* pmeRemoteForcePtr = (sendForcesDirectToPpGpu || stageThreadMpiGpuCpuComm_)
                                        ? pmeRemoteGpuForcePtr_[ppRank]
                                        : pmeRemoteCpuForcePtr_[ppRank];

    pmeForcesReady_->enqueueWaitEvent(*ppCommStream_[ppRank]);

    // Push data to remote GPU's memory
    cudaError_t stat = cudaMemcpyAsync(pmeRemoteForcePtr,
                                       localForcePtr_[ppRank],
                                       numAtoms * sizeof(rvec),
                                       cudaMemcpyDefault,
                                       ppCommStream_[ppRank]->stream());
    CU_RET_ERR(stat, "cudaMemcpyAsync on Recv from PME CUDA direct data transfer failed");

    if (stageThreadMpiGpuCpuComm_ && !sendForcesDirectToPpGpu)
    {
        // Perform local D2H (from remote GPU memory to remote PP rank's CPU memory)
        // to finalize staged data transfer
        stat = cudaMemcpyAsync(pmeRemoteCpuForcePtr_[ppRank],
                               pmeRemoteGpuForcePtr_[ppRank],
                               numAtoms * sizeof(rvec),
                               cudaMemcpyDefault,
                               ppCommStream_[ppRank]->stream());
        CU_RET_ERR(stat, "cudaMemcpyAsync on local device to host transfer of PME forces failed");
    }

    ppCommEvent_[ppRank]->markEvent(*ppCommStream_[ppRank]);
    std::atomic<bool>* tmpPpCommEventRecordedPtr =
            reinterpret_cast<std::atomic<bool>*>(&(ppCommEventRecorded_[ppRank]));
    tmpPpCommEventRecordedPtr->store(true, std::memory_order_release);
#else
    GMX_UNUSED_VALUE(ppRank);
    GMX_UNUSED_VALUE(numAtoms);
#endif
}

/*! \brief Send PME data directly using GPU-aware MPI */
void PmeForceSenderGpu::Impl::sendFToPpCudaMpi(DeviceBuffer<RVec> sendbuf,
                                               int                offset,
                                               int                numBytes,
                                               int                ppRank,
                                               MPI_Request*       request)
{
    GMX_ASSERT(GMX_LIB_MPI, "sendFToPpCudaMpi is expected to be called only for Lib-MPI");

#if GMX_MPI
    // if using GPU direct comm with GPU-aware MPI, make sure forces are ready on device
    // before sending it to PP ranks
    pmeForcesReady_->waitForEvent();

    MPI_Isend(sendbuf[offset], numBytes, MPI_BYTE, ppRank, 0, comm_, request);

#else
    GMX_UNUSED_VALUE(sendbuf);
    GMX_UNUSED_VALUE(offset);
    GMX_UNUSED_VALUE(numBytes);
    GMX_UNUSED_VALUE(ppRank);
    GMX_UNUSED_VALUE(request);
#endif
}

PmeForceSenderGpu::PmeForceSenderGpu(GpuEventSynchronizer*  pmeForcesReady,
                                     MPI_Comm               comm,
                                     const DeviceContext&   deviceContext,
                                     gmx::ArrayRef<PpRanks> ppRanks) :
    impl_(new Impl(pmeForcesReady, comm, deviceContext, ppRanks))
{
}

PmeForceSenderGpu::~PmeForceSenderGpu() = default;


void PmeForceSenderGpu::setForceSendBuffer(DeviceBuffer<RVec> d_f)
{
    impl_->setForceSendBuffer(d_f);
}

void PmeForceSenderGpu::sendFToPpCudaMpi(DeviceBuffer<RVec> sendbuf,
                                         int                offset,
                                         int                numBytes,
                                         int                ppRank,
                                         MPI_Request*       request)
{
    impl_->sendFToPpCudaMpi(sendbuf, offset, numBytes, ppRank, request);
}

void PmeForceSenderGpu::sendFToPpCudaDirect(int ppRank, int numAtoms, bool sendForcesDirectToPpGpu)
{
    impl_->sendFToPpCudaDirect(ppRank, numAtoms, sendForcesDirectToPpGpu);
}


} // namespace gmx

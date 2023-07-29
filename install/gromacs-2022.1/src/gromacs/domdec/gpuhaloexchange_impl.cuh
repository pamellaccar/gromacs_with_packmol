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
 * \brief Declares CUDA implementation of GPU Halo Exchange.
 *
 * This header file is needed to include from both the device-side
 * kernels file, and the host-side management code.
 *
 * \author Alan Gray <alang@nvidia.com>
 *
 * \ingroup module_domdec
 */
#ifndef GMX_DOMDEC_GPUHALOEXCHANGE_IMPL_H
#define GMX_DOMDEC_GPUHALOEXCHANGE_IMPL_H

#include "gromacs/domdec/gpuhaloexchange.h"
#include "gromacs/gpu_utils/device_context.h"
#include "gromacs/gpu_utils/gpueventsynchronizer.h"
#include "gromacs/gpu_utils/hostallocator.h"
#include "gromacs/utility/gmxmpi.h"

struct gmx_wallcycle;

namespace gmx
{

/*! \brief switch for whether coordinates or force halo is being applied */
enum class HaloQuantity
{
    HaloCoordinates,
    HaloForces
};

/*! \internal \brief Class with interfaces and data for GPU Halo Exchange */
class GpuHaloExchange::Impl
{

public:
    /*! \brief Creates GPU Halo Exchange object.
     *
     * \param [inout] dd                       domdec structure
     * \param [in]    dimIndex                 the dimension index for this instance
     * \param [in]    mpi_comm_mysim           communicator used for simulation
     * \param [in]    deviceContext            GPU device context
     * \param [in]    pulse                    the communication pulse for this instance
     * \param [in]    wcycle                   The wallclock counter
     */
    Impl(gmx_domdec_t*        dd,
         int                  dimIndex,
         MPI_Comm             mpi_comm_mysim,
         const DeviceContext& deviceContext,
         int                  pulse,
         gmx_wallcycle*       wcycle);
    ~Impl();

    /*! \brief
     * (Re-) Initialization for GPU halo exchange
     * \param [in] d_coordinatesBuffer  pointer to coordinates buffer in GPU memory
     * \param [in] d_forcesBuffer   pointer to forces buffer in GPU memory
     */
    void reinitHalo(float3* d_coordinatesBuffer, float3* d_forcesBuffer);


    /*! \brief
     * GPU halo exchange of coordinates buffer
     * \param [in] box  Coordinate box (from which shifts will be constructed)
     * \param [in] dependencyEvent   Dependency event for this operation
     * \returns                      Event recorded when this operation has been launched
     */
    GpuEventSynchronizer* communicateHaloCoordinates(const matrix box, GpuEventSynchronizer* dependencyEvent);

    /*! \brief  GPU halo exchange of force buffer
     * \param [in] accumulateForces  True if forces should accumulate, otherwise they are set
     * \param [in] dependencyEvents  Dependency events for this operation
     */
    void communicateHaloForces(bool                                           accumulateForces,
                               FixedCapacityVector<GpuEventSynchronizer*, 2>* dependencyEvents);

    /*! \brief Get the event synchronizer for the forces ready on device.
     *  \returns  The event to synchronize the stream that consumes forces on device.
     */
    GpuEventSynchronizer* getForcesReadyOnDeviceEvent();

private:
    /*! \brief Data transfer wrapper for GPU halo exchange
     * \param [in] sendPtr      send buffer address
     * \param [in] sendSize     number of elements to send
     * \param [in] sendRank     rank of destination
     * \param [in] recvPtr      receive buffer address
     * \param [in] recvSize     number of elements to receive
     * \param [in] recvRank     rank of source
     */
    void communicateHaloData(float3* sendPtr, int sendSize, int sendRank, float3* recvPtr, int recvSize, int recvRank);

    /*! \brief Data transfer for GPU halo exchange using CUDA memcopies
     * \param [inout] sendPtr    address to send data from
     * \param [in] sendSize      number of atoms to be sent
     * \param [in] sendRank      rank to send data to
     * \param [in] remotePtr     remote address to recv data
     * \param [in] recvRank      rank to recv data from
     */
    void communicateHaloDataWithCudaDirect(float3* sendPtr, int sendSize, int sendRank, float3* remotePtr, int recvRank);

    /*! \brief Data transfer wrapper for GPU halo exchange using MPI_send and MPI_Recv
     * \param [in] sendPtr      send buffer address
     * \param [in] sendSize     number of elements to send
     * \param [in] sendRank     rank of destination
     * \param [in] recvPtr      receive buffer address
     * \param [in] recvSize     number of elements to receive
     * \param [in] recvRank     rank of source
     */
    void communicateHaloDataWithCudaMPI(float3* sendPtr,
                                        int     sendSize,
                                        int     sendRank,
                                        float3* recvPtr,
                                        int     recvSize,
                                        int     recvRank);

    /*! \brief Exchange coordinate-ready event with neighbor ranks and enqueue wait in halo stream
     * \param [in] eventSync    event recorded when coordinates/forces are ready to device
     */
    void enqueueWaitRemoteCoordinatesReadyEvent(GpuEventSynchronizer* coordinatesReadyOnDeviceEvent);

    //! Domain decomposition object
    gmx_domdec_t* dd_ = nullptr;
    //! map of indices to be sent from this rank
    gmx::HostVector<int> h_indexMap_;
    //! device copy of index map
    int* d_indexMap_ = nullptr;
    //! number of elements in index map array
    int indexMapSize_ = -1;
    //! number of elements allocated in index map array
    int indexMapSizeAlloc_ = -1;
    //! device buffer for sending packed data
    float3* d_sendBuf_ = nullptr;
    //! number of atoms in sendbuf array
    int sendBufSize_ = -1;
    //! number of atoms allocated in sendbuf array
    int sendBufSizeAlloc_ = -1;
    //! device buffer for receiving packed data
    float3* d_recvBuf_ = nullptr;
    //! maximum size of packed buffer
    int maxPackedBufferSize_ = 0;
    //! number of atoms in recvbuf array
    int recvBufSize_ = -1;
    //! number of atoms allocated in recvbuf array
    int recvBufSizeAlloc_ = -1;
    //! rank to send data to for X
    int sendRankX_ = 0;
    //! rank to recv data from for X
    int recvRankX_ = 0;
    //! rank to send data to for F
    int sendRankF_ = 0;
    //! rank to recv data from for F
    int recvRankF_ = 0;
    //! send copy size from this rank for X
    int xSendSize_ = 0;
    //! recv copy size to this rank for X
    int xRecvSize_ = 0;
    //! send copy size from this rank for F
    int fSendSize_ = 0;
    //! recv copy size to this rank for F
    int fRecvSize_ = 0;
    //! number of home atoms - offset of local halo region
    int numHomeAtoms_ = 0;
    //! remote GPU coordinates buffer pointer for pushing data
    float3* remoteXPtr_ = nullptr;
    //! remote GPU force buffer pointer for pushing data
    float3* remoteFPtr_ = nullptr;
    //! Periodic Boundary Conditions for this rank
    bool usePBC_ = false;
    //! force shift buffer on device
    float3* d_fShift_ = nullptr;
    //! Event triggered when halo transfer has been launched with direct CUD memory copy
    GpuEventSynchronizer* haloDataTransferLaunched_ = nullptr;
    //! MPI communicator used for simulation
    MPI_Comm mpi_comm_mysim_;
    //! GPU context object
    const DeviceContext& deviceContext_;
    //! CUDA stream for this halo exchange
    DeviceStream* haloStream_;
    //! full coordinates buffer in GPU memory
    float3* d_x_ = nullptr;
    //! full forces buffer in GPU memory
    float3* d_f_ = nullptr;
    //! An event recorded once the exchanged forces are ready on the GPU
    GpuEventSynchronizer fReadyOnDevice_;
    //! The dimension index corresponding to this halo exchange instance
    int dimIndex_ = 0;
    //! The pulse corresponding to this halo exchange instance
    int pulse_ = 0;
    //! The wallclock counter
    gmx_wallcycle* wcycle_ = nullptr;
    //! The atom offset for receive (x) or send (f) for dimension index and pulse corresponding to this halo exchange instance
    int atomOffset_ = 0;
    //! Event triggered when coordinate halo has been launched
    GpuEventSynchronizer coordinateHaloLaunched_;
};

} // namespace gmx

#endif

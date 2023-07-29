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
 *  \brief Implements stub GPU 3D FFT routines for CPU-only builds
 *
 *  \author Mark Abraham <mark.j.abraham@gmail.com>
 *  \author Gaurav Garg <gaugarg@nvidia.com>
 *  \ingroup module_fft
 */

#include "gmxpre.h"

#include "gpu_3dfft.h"
#include "gpu_3dfft_impl.h"

#if GMX_GPU_CUDA
#    include "gpu_3dfft_cufft.h"
#elif GMX_GPU_OPENCL
#    include "gpu_3dfft_ocl.h"
#elif GMX_GPU_SYCL
#    include "gpu_3dfft_sycl.h"
#    if GMX_SYCL_DPCPP && GMX_FFT_MKL
#        include "gpu_3dfft_sycl_mkl.h"
#    endif
#    if GMX_SYCL_HIPSYCL && GMX_HIPSYCL_HAVE_HIP_TARGET
#        include "gpu_3dfft_sycl_rocfft.h"
#    endif
#endif

#if Heffte_FOUND
#    include "gpu_3dfft_heffte.h"
#endif

#include "gromacs/utility/arrayref.h"
#include "gromacs/utility/exceptions.h"

namespace gmx
{

// [[noreturn]] attributes must be added in the common headers, so it's easier to silence the warning here
#ifdef __clang__
#    pragma clang diagnostic push
#    pragma clang diagnostic ignored "-Wmissing-noreturn"
#endif

#if (GMX_GPU_CUDA || GMX_GPU_OPENCL || GMX_GPU_SYCL)

Gpu3dFft::Gpu3dFft(FftBackend           backend,
                   bool                 allocateGrids,
                   MPI_Comm             comm,
                   ArrayRef<const int>  gridSizesInXForEachRank,
                   ArrayRef<const int>  gridSizesInYForEachRank,
                   const int            nz,
                   bool                 performOutOfPlaceFFT,
                   const DeviceContext& context,
                   const DeviceStream&  pmeStream,
                   ivec                 realGridSize,
                   ivec                 realGridSizePadded,
                   ivec                 complexGridSizePadded,
                   DeviceBuffer<float>* realGrid,
                   DeviceBuffer<float>* complexGrid)
{
#    if GMX_GPU_CUDA
    switch (backend)
    {
        case FftBackend::Cufft:
            impl_ = std::make_unique<Gpu3dFft::ImplCuFft>(allocateGrids,
                                                          comm,
                                                          gridSizesInXForEachRank,
                                                          gridSizesInYForEachRank,
                                                          nz,
                                                          performOutOfPlaceFFT,
                                                          context,
                                                          pmeStream,
                                                          realGridSize,
                                                          realGridSizePadded,
                                                          complexGridSizePadded,
                                                          realGrid,
                                                          complexGrid);
            break;
        default:
            GMX_RELEASE_ASSERT(backend == FftBackend::HeFFTe_CUDA,
                               "Unsupported FFT backend requested");
    }
#    elif GMX_GPU_OPENCL
    switch (backend)
    {
        case FftBackend::Ocl:
            impl_ = std::make_unique<Gpu3dFft::ImplOcl>(allocateGrids,
                                                        comm,
                                                        gridSizesInXForEachRank,
                                                        gridSizesInYForEachRank,
                                                        nz,
                                                        performOutOfPlaceFFT,
                                                        context,
                                                        pmeStream,
                                                        realGridSize,
                                                        realGridSizePadded,
                                                        complexGridSizePadded,
                                                        realGrid,
                                                        complexGrid);
            break;
        default: GMX_THROW(InternalError("Unsupported FFT backend requested"));
    }
#    elif GMX_GPU_SYCL
    switch (backend)
    {
#        if GMX_SYCL_DPCPP && GMX_FFT_MKL
        case FftBackend::SyclMkl:
            impl_ = std::make_unique<Gpu3dFft::ImplSyclMkl>(allocateGrids,
                                                            comm,
                                                            gridSizesInXForEachRank,
                                                            gridSizesInYForEachRank,
                                                            nz,
                                                            performOutOfPlaceFFT,
                                                            context,
                                                            pmeStream,
                                                            realGridSize,
                                                            realGridSizePadded,
                                                            complexGridSizePadded,
                                                            realGrid,
                                                            complexGrid);
            break;
#        endif
#        if GMX_SYCL_HIPSYCL && GMX_HIPSYCL_HAVE_HIP_TARGET
        case FftBackend::SyclRocfft:
            impl_ = std::make_unique<Gpu3dFft::ImplSyclRocfft>(allocateGrids,
                                                               comm,
                                                               gridSizesInXForEachRank,
                                                               gridSizesInYForEachRank,
                                                               nz,
                                                               performOutOfPlaceFFT,
                                                               context,
                                                               pmeStream,
                                                               realGridSize,
                                                               realGridSizePadded,
                                                               complexGridSizePadded,
                                                               realGrid,
                                                               complexGrid);
            break;
#        endif
        case FftBackend::Sycl:
            impl_ = std::make_unique<Gpu3dFft::ImplSycl>(allocateGrids,
                                                         comm,
                                                         gridSizesInXForEachRank,
                                                         gridSizesInYForEachRank,
                                                         nz,
                                                         performOutOfPlaceFFT,
                                                         context,
                                                         pmeStream,
                                                         realGridSize,
                                                         realGridSizePadded,
                                                         complexGridSizePadded,
                                                         realGrid,
                                                         complexGrid);
            break;
        default: GMX_THROW(InternalError("Unsupported FFT backend requested"));
    }
#    endif

#    if Heffte_FOUND
    switch (backend)
    {
        case FftBackend::HeFFTe_CUDA:
            GMX_RELEASE_ASSERT(
                    GMX_GPU_CUDA,
                    "HeFFTe_CUDA FFT backend is supported only with GROMACS compiled with CUDA");
            GMX_RELEASE_ASSERT(heffte::backend::is_enabled<heffte::backend::cufft>::value,
                               "HeFFTe not compiled with CUDA support");
            impl_ = std::make_unique<Gpu3dFft::ImplHeFfte<heffte::backend::cufft>>(
                    allocateGrids,
                    comm,
                    gridSizesInXForEachRank,
                    gridSizesInYForEachRank,
                    nz,
                    performOutOfPlaceFFT,
                    context,
                    pmeStream,
                    realGridSize,
                    realGridSizePadded,
                    complexGridSizePadded,
                    realGrid,
                    complexGrid);

            break;
        default: GMX_RELEASE_ASSERT(impl_ != nullptr, "Unsupported FFT backend requested");
    }
#    endif
}

#else

Gpu3dFft::Gpu3dFft(FftBackend /*backend */,
                   bool /*allocateGrids*/,
                   MPI_Comm /*comm*/,
                   ArrayRef<const int> /*gridSizesInXForEachRank*/,
                   ArrayRef<const int> /*gridSizesInYForEachRank*/,
                   const int /*nz*/,
                   bool /*performOutOfPlaceFFT*/,
                   const DeviceContext& /*context*/,
                   const DeviceStream& /*pmeStream*/,
                   ivec /*realGridSize*/,
                   ivec /*realGridSizePadded*/,
                   ivec /*complexGridSizePadded*/,
                   DeviceBuffer<float>* /*realGrid*/,
                   DeviceBuffer<float>* /*complexGrid*/)
{
    GMX_THROW(InternalError("Cannot run GPU routines in a CPU-only configuration"));
}

#endif

Gpu3dFft::~Gpu3dFft() = default;

void Gpu3dFft::perform3dFft(gmx_fft_direction dir, CommandEvent* timingEvent)
{
    GMX_RELEASE_ASSERT(impl_ != nullptr, "Cannot run GPU routines in a CPU-only configuration");
    impl_->perform3dFft(dir, timingEvent);
}

#ifdef __clang__
#    pragma clang diagnostic pop
#endif

} // namespace gmx

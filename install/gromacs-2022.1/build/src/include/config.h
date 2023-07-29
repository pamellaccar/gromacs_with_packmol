/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2009- The GROMACS Authors
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
/*! \libinternal \file
 * \brief
 * Include file for configuration macros from the build system.
 *
 * This header is not installed, so headers must not reference macros defined
 * here.
 *
 * \inlibraryapi
 */
#ifndef GMX_CONFIG_H
#define GMX_CONFIG_H

/* TODO: For now, disable Doxygen warnings from here */
/*! \cond */

/* Work around broken calloc() */
#define GMX_BROKEN_CALLOC 0

/* Do not optimize FFTW setups (not needed with SSE FFT kernels) */
#define GMX_DISABLE_FFTW_MEASURE 0

/* Use FFTW3 FFT library */
#define GMX_FFT_FFTW3 0

/* Use the ARM Performance library with FFTW3 compatibility */
#define GMX_FFT_ARMPL_FFTW3 0

/* Use MKL FFT library */
#define GMX_FFT_MKL 0

/* Use built in fftpack FFT library */
#define GMX_FFT_FFTPACK 1

/* Target platform is x86 or x86_64 */
#define GMX_TARGET_X86 1

/** Define if we are building natively on Windows */
#define GMX_NATIVE_WINDOWS 0

/** Define if we are building for Cygwin */
#define GMX_CYGWIN 0

/* SSE2 was selected for SIMD instruction set level */
#define GMX_SIMD_X86_SSE2 0

/* SSE4.1 was selected as SIMD instructions */
#define GMX_SIMD_X86_SSE4_1 0

/* AVX 128-bit FMA was selected as SIMD instructions */
#define GMX_SIMD_X86_AVX_128_FMA 0

/* AVX 256-bit was selected as SIMD instructions */
#define GMX_SIMD_X86_AVX_256 0

/* AVX2 256-bit SIMD instruction set level was selected */
#define GMX_SIMD_X86_AVX2_256 1

/* AVX2 128-bit SIMD instruction set level was selected */
#define GMX_SIMD_X86_AVX2_128 0

/* AVX-512F foundation level instruction SIMD */
#define GMX_SIMD_X86_AVX_512 0

/* AVX-512ER foundation level instruction SIMD */
#define GMX_SIMD_X86_AVX_512_KNL 0

/* ARM (AArch64) NEON Advanced SIMD instruction set level was selected */
#define GMX_SIMD_ARM_NEON_ASIMD 0

/* ARM (SVE) Scalable Vector extensions */
#define GMX_SIMD_ARM_SVE 0

/* SVE vector length */
#define GMX_SIMD_ARM_SVE_LENGTH_VALUE 

/* IBM VSX was selected as SIMD instructions (Power 7 and later) */
#define GMX_SIMD_IBM_VSX 0

/* Reference SIMD implementation for testing */
#define GMX_SIMD_REFERENCE 0

/* String for SIMD instruction choice (for writing to log files and stdout) */
#define GMX_SIMD_STRING "AVX2_256"

/* Calling convention string (if any) for routines with SIMD variable args */
#define gmx_simdcall  

/* Target mantissa accuracy for SIMD single precision math */
#define GMX_SIMD_ACCURACY_BITS_SINGLE 22

/* Target mantissa accuracy for SIMD double precision math */
#define GMX_SIMD_ACCURACY_BITS_DOUBLE 44

/* Enable code that requires AVX-512 instruction support, without GMX_SIMD=AVX_512 */
#define SIMD_AVX_512_CXX_SUPPORTED 1

/* Whether NBNXM and other SIMD kernels should be compiled */
#define GMX_USE_SIMD_KERNELS 1

/* Integer byte order is big endian. */
#define GMX_INTEGER_BIG_ENDIAN 0

/* Use our own instead of system XDR libraries */
#define GMX_INTERNAL_XDR 1

/* Compile to use TNG library */
#define GMX_USE_TNG 1

/* Add support for tracing using Extrae */
#define HAVE_EXTRAE 0

/* Use MPI (with mpicc) for parallelization */
#define GMX_LIB_MPI 1

/* Use threads_mpi for parallelization */
#define GMX_THREAD_MPI 0

/* Make a parallel version of GROMACS using message passing
   (MPI or thread_mpi) */
#define GMX_MPI (GMX_LIB_MPI || GMX_THREAD_MPI)

/* Use OpenMP multithreading */
#define GMX_OPENMP 1

/* Use the Portable Hardware Locality package (hwloc) */
#define GMX_USE_HWLOC 0

/* Library version found for hwloc during configuration time */
#define GMX_HWLOC_API_VERSION 

/* Can and should use nice(3) to set priority */
#define GMX_USE_NICE 1

/* Maximum number of OpenMP threads supported */
#define GMX_OPENMP_MAX_THREADS 128

/* Use if we cannot rename checkpoints */
#define GMX_NO_RENAME 0

/* Use sub-counters */
#define GMX_CYCLE_SUBCOUNTERS 0

/* Compile with plugin support */
#define GMX_USE_PLUGINS 0

/* Fallback path for VMD plug-ins */
#define GMX_VMD_PLUGIN_PATH ""

/* Default path for DSSP program */
#define GMX_DSSP_PROGRAM_PATH "/usr/local/bin/dssp"

/* Define when pthreads are used */
#define THREAD_PTHREADS

/* Define when Windows threads are used */
/* #undef THREAD_WINDOWS */

/* Define for busy wait option  */
/* See gmxpre-config.h.cmakein for explanation for the #ifndef */
#ifndef TMPI_WAIT_FOR_NO_ONE
#define TMPI_WAIT_FOR_NO_ONE 0
#endif

/* Define for copy buffer option */
/* #undef TMPI_COPY_BUFFER */

/* Define for tmpi warnings option */
/* #undef TMPI_WARNINGS */

/* Define for profiling option */
/* #undef TMPI_PROFILE */

/* Define for Linux pthread_setaffinity_np */
#define HAVE_PTHREAD_SETAFFINITY

/* Define for X-Windows */
#define GMX_X11 0

/* Enable x86 gcc inline assembly */
#define GMX_X86_GCC_INLINE_ASM 1

/* Define if any type of GPU acceleration is compiled */
#define GMX_GPU 0

/* Define if CUDA GPU acceleration is compiled */
#define GMX_GPU_CUDA 0

/* Define if OpenCL GPU acceleration is compiled */
#define GMX_GPU_OPENCL 0

/* Define if SYCL GPU acceleration is compiled */
#define GMX_GPU_SYCL 0

/* Define if hipSYCL is used for SYCL support (otherwise DPC++ is assumed) */
#define GMX_SYCL_HIPSYCL 0

// Define if hipSYCL has HIP target(s)
#define GMX_HIPSYCL_HAVE_HIP_TARGET 0

// Define if hipSYCL has CUDA target(s)
#define GMX_HIPSYCL_HAVE_CUDA_TARGET 0

/* Define if Intel's DPC++ is used (default unless hipSYCL is chosen) */
#define GMX_SYCL_DPCPP (!GMX_SYCL_HIPSYCL && GMX_GPU_SYCL)

/* Define if we wish to use USM (otherwise buffer-accessor mechanism is used) */
#define GMX_SYCL_USE_USM 0

/* Use a single compilation unit when compiling the CUDA (non-bonded) kernels.  */
#define GMX_CUDA_NB_SINGLE_COMPILATION_UNIT 0

/* Use CUDA-aware MPI.  */
#define HAVE_MPI_EXT 0
#define MPI_SUPPORTS_CUDA_AWARE_DETECTION 0

/* Define if HeFFTe library found */
#define Heffte_FOUND 0

/* Cluster size used by nonbonded kernel. Should be 8 for NVIDIA/AMD and 4 for Intel */
#define GMX_GPU_NB_CLUSTER_SIZE 

/* Define constants for build types (starting at 1 to make sure undefined values don't match) */
#define CMAKE_BUILD_TYPE_DEBUG 1
#define CMAKE_BUILD_TYPE_RELEASE 2
#define CMAKE_BUILD_TYPE_RELWITHDEBINFO 3
#define CMAKE_BUILD_TYPE_MINSIZEREL 4
#define CMAKE_BUILD_TYPE_REFERENCE 5
#define CMAKE_BUILD_TYPE_RELWITHASSERT 6
#define CMAKE_BUILD_TYPE_PROFILE 7
#define CMAKE_BUILD_TYPE_TSAN 8
#define CMAKE_BUILD_TYPE_ASAN 9
#define CMAKE_BUILD_TYPE_MSAN 10
#define CMAKE_BUILD_TYPE_UBSAN 11
#define CMAKE_BUILD_TYPE CMAKE_BUILD_TYPE_RELEASE

/* Define relative path to OpenCL kernels */
#define GMX_INSTALL_OCLDIR ""

/* Minimum required OpenCL version support (both API and device) - split into integer components for convenience */
#define REQUIRED_OPENCL_MIN_VERSION_MAJOR 
#define REQUIRED_OPENCL_MIN_VERSION_MINOR 

/* Define to 1 if fseeko (and presumably ftello) exists and is declared. */
#define HAVE_FSEEKO 1

/* Define to 1 if _fseeki64 (and presumably _fseeki64) exists and is declared. */
//NOLINTNEXTLINE(bugprone-reserved-identifier)
#define HAVE__FSEEKI64 0

/* Have io.h (windows)*/
#define HAVE_IO_H 0

/* Define to 1 if you have the posix_memalign() function. */
#define HAVE_POSIX_MEMALIGN 1

/* Define to 1 if you have the memalign() function. */
#define HAVE_MEMALIGN 0

/* Define to 1 if you have the MSVC _aligned_malloc() function. */
//NOLINTNEXTLINE(bugprone-reserved-identifier)
#define HAVE__ALIGNED_MALLOC 0

/* Define to 1 if you have the clock_gettime() function. */
#define HAVE_CLOCK_GETTIME 1

/* Define to 1 if you have the gettimeofday() function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the rdtscp instruction (ie essentially all x86 still in use. */
#define GMX_USE_RDTSCP 1

/* Define to 1 if you have the fsync() function. */
#define HAVE_FSYNC 1

/* Define to 1 if you have the Windows _commit() function. */
//NOLINTNEXTLINE(bugprone-reserved-identifier)
#define HAVE__COMMIT 0

/* Define to 1 if you have the fileno() function. */
#define HAVE_FILENO 1

/* Define to 1 if you have the _fileno() function. */
//NOLINTNEXTLINE(bugprone-reserved-identifier)
#define HAVE__FILENO 0

/* Define to 1 if you have the sigaction() function. */
#define HAVE_SIGACTION 1

/* Define for the GNU __builtin_clz() function. */
#define HAVE_BUILTIN_CLZ 1

/* Define for the GNU __builtin_clzll() function. */
#define HAVE_BUILTIN_CLZLL 1

/* Define for the MSVC _BitScanReverse() function. */
#define HAVE_BITSCANREVERSE 0

/* Define for the MSVC _BitScanReverse64() function. */
#define HAVE_BITSCANREVERSE64 0

/* Define for the IBM xlc++ __cntlz4() function. */
#define HAVE_CNTLZ4 0

/* Define for the IBM xlc++ __cntlz8() function. */
#define HAVE_CNTLZ8 0

/* Define to 1 if yo have the <unistd.h> header file. */
#define HAVE_UNISTD_H
#  ifdef __APPLE__
// Mac OS 13.x has a bug where dispatch.h generates an error for OpenCL builds if
// HAVE_UNISTD_H is merely defined, but not set to 1. Since unistd.h should always
// be available on this platform we simply undefine and redefine it to 1 for now
#    undef  HAVE_UNISTD_H
#    define HAVE_UNISTD_H 1
#endif

/* Define to 1 if yo have the <pwd.h> header file. */
#define HAVE_PWD_H 1

/* Define to 1 if yo have the <dirent.h> header file. */
#define HAVE_DIRENT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H

/* Define to 1 if you have the <sched.h> header */
#define HAVE_SCHED_H

/* Define to 1 if mm_malloc.h is present, otherwise 0 */
#define HAVE_MM_MALLOC_H 1

/* Define to 1 if malloc.h is present, otherwise 0 */
#define HAVE_MALLOC_H 1

/* Define to 1 if xmmintrin.h is present, otherwise 0 */
#define HAVE_XMMINTRIN_H 1

/* Define to 1 if you have the sysconf() function */
#define HAVE_SYSCONF

/* Define to 1 if you have the all the affinity functions in sched.h */
#define HAVE_SCHED_AFFINITY 1

/* Define to 1 if _mm_malloc() is present in either mm_malloc.h,
 * malloc.h or xmmintrin.h, and 0 otherwise. Note that you need to
 * conditionally include the three headers too before using _mm_malloc().
 */
//NOLINTNEXTLINE(bugprone-reserved-identifier)
#define HAVE__MM_MALLOC 1

/* Define if SIGUSR1 is present */
#define HAVE_SIGUSR1 1

/* Enable gromacs quotes */
#define GMX_COOL_QUOTES 1

/* default name mangling maybe wrong on exotic plattforms */
#define F77_FUNC(name,NAME) name ## _

/* Define if we have pipes */
#define HAVE_PIPES 1

/* Define if we have feenableexcept */
#define HAVE_FEENABLEEXCEPT 1

/* Define if we have fedisableexcept */
#define HAVE_FEDISABLEEXCEPT 1

/* Define if we have MKL available */
#define HAVE_LIBMKL 0

/* Define if we have lmfit support */
#define HAVE_LMFIT 1

/* Define if we have muparser support */
#define HAVE_MUPARSER 1

/* Build using clang analyzer */
#define GMX_CLANG_ANALYZER 0

/* Use Interactive Molecular Dynamics */
#define GMX_IMD 1

/*! \endcond */

#endif

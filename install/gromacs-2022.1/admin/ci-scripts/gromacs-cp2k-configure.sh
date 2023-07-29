#!/usr/bin/env bash
set -e
CMAKE=${CMAKE:-$(which cmake)}
echo $CMAKE_COMPILER_SCRIPT
echo $CMAKE_EXTRA_OPTIONS
echo $CMAKE_SIMD_OPTIONS
echo $CMAKE_GPU_OPTIONS
echo $CMAKE_MPI_OPTIONS
echo $CMAKE_PRECISION_OPTIONS
echo $CMAKE_BUILD_TYPE_OPTIONS
echo $CMAKE_GMXAPI_OPTIONS
echo $CP2K_DIR
echo $CP2K_LINKER_FLAGS
if [[ -d $BUILD_DIR ]] ; then
      rm -rf $BUILD_DIR && mkdir $BUILD_DIR ;
else
      echo "Preparing new build directory" ;
      mkdir $BUILD_DIR
fi
cd $BUILD_DIR
$CMAKE .. \
      -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
      $CMAKE_COMPILER_SCRIPT \
      $CMAKE_EXTRA_OPTIONS \
      $CMAKE_SIMD_OPTIONS \
      $CMAKE_MPI_OPTIONS \
      $CMAKE_PRECISION_OPTIONS \
      $CMAKE_BUILD_TYPE_OPTIONS \
      $CMAKE_GPU_OPTIONS \
      $CMAKE_GMXAPI_OPTIONS \
      -DGMX_CP2K=ON \
      -DCP2K_DIR="${CP2K_DIR}" \
      -DCP2K_LINKER_FLAGS="${CP2K_LINKER_FLAGS}" \
      -DCMAKE_INSTALL_PREFIX=../$INSTALL_DIR -DGMX_COMPILER_WARNINGS=ON \
      2>&1 | tee cmakeLog.log
awk '/CMake Warning/,/^--|^$/' cmakeLog.log | tee cmakeErrors.log
if [ -s cmakeErrors.log  ] ; then echo "Found CMake warning while processing build"; cat cmakeErrors.log ; exit 1; fi
cd ..

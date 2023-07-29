# Install script for directory: /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/pamella/Documentos/softwares/gromacs-2022.1")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libnblib_gmx.so.0.1.0"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libnblib_gmx.so.0"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnblib_gmx.so.0.1.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnblib_gmx.so.0"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libnblib_gmx.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnblib_gmx.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnblib_gmx.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnblib_gmx.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/nblib" TYPE FILE FILES
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/basicdefinitions.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/box.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/exception.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/gmxcalculatorcpu.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/integrator.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/interactions.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/molecules.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/kerneloptions.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/nblib.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/nbnxmsetuphelpers.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particlesequencer.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particletype.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/simulationstate.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topology.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/tpr.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/vector.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/listed_forces/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/samples/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/util/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/tests/cmake_install.cmake")
endif()


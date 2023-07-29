# Install script for directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libmuparser.so.2.3.2"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libmuparser.so.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmuparser.so.2.3.2"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmuparser.so.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimeLibrariesx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/pamella/Documentos/softwares/gromacs-2022.1/build/lib/libmuparser.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmuparser.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmuparser.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmuparser.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelopmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserBase.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserBytecode.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserCallback.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserDef.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserDLL.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserError.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserFixes.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParser.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserInt.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserTemplateMagic.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserTest.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserToken.h"
    "/home/pamella/Documentos/softwares/gromacs-2022.1/src/external/muparser/include/muParserTokenReader.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pamella/Documentos/softwares/gromacs-2022.1/build/muparser.pc")
endif()


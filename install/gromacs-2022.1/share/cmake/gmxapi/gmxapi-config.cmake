set(gmxapi_VERSION 0.3.1)

####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was gmxapi-config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################
# Refer to CMake docs for information on more elaborate use of this stub file:
# https://cmake.org/cmake/help/v3.4/module/CMakePackageConfigHelpers.html#command:configure_package_config_file
include(CMakeFindDependencyMacro)

include("${CMAKE_CURRENT_LIST_DIR}/gmxapi.cmake")
check_required_components(gmxapi)
set_property(TARGET Gromacs::gmxapi PROPERTY MPI "library")

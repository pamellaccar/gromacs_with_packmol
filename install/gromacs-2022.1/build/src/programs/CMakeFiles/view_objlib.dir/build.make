# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pamella/Documentos/softwares/gromacs-2022.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pamella/Documentos/softwares/gromacs-2022.1/build

# Include any dependencies generated for this target.
include src/programs/CMakeFiles/view_objlib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/programs/CMakeFiles/view_objlib.dir/compiler_depend.make

# Include the progress variables for this target.
include src/programs/CMakeFiles/view_objlib.dir/progress.make

# Include the compile flags for this target's objects.
include src/programs/CMakeFiles/view_objlib.dir/flags.make

src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o: src/programs/CMakeFiles/view_objlib.dir/flags.make
src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o: ../src/programs/view/view.cpp
src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o: src/programs/CMakeFiles/view_objlib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o -MF CMakeFiles/view_objlib.dir/view/view.cpp.o.d -o CMakeFiles/view_objlib.dir/view/view.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/src/programs/view/view.cpp

src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/view_objlib.dir/view/view.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/src/programs/view/view.cpp > CMakeFiles/view_objlib.dir/view/view.cpp.i

src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/view_objlib.dir/view/view.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/src/programs/view/view.cpp -o CMakeFiles/view_objlib.dir/view/view.cpp.s

view_objlib: src/programs/CMakeFiles/view_objlib.dir/view/view.cpp.o
view_objlib: src/programs/CMakeFiles/view_objlib.dir/build.make
.PHONY : view_objlib

# Rule to build all files generated by this target.
src/programs/CMakeFiles/view_objlib.dir/build: view_objlib
.PHONY : src/programs/CMakeFiles/view_objlib.dir/build

src/programs/CMakeFiles/view_objlib.dir/clean:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs && $(CMAKE_COMMAND) -P CMakeFiles/view_objlib.dir/cmake_clean.cmake
.PHONY : src/programs/CMakeFiles/view_objlib.dir/clean

src/programs/CMakeFiles/view_objlib.dir/depend:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pamella/Documentos/softwares/gromacs-2022.1 /home/pamella/Documentos/softwares/gromacs-2022.1/src/programs /home/pamella/Documentos/softwares/gromacs-2022.1/build /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/programs/CMakeFiles/view_objlib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/programs/CMakeFiles/view_objlib.dir/depend


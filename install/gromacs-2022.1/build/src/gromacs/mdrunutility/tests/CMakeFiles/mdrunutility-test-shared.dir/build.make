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
include src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/compiler_depend.make

# Include the progress variables for this target.
include src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/progress.make

# Include the compile flags for this target's objects.
include src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/flags.make

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/flags.make
src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o: ../src/gromacs/mdrunutility/tests/threadaffinitytest.cpp
src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o -MF CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o.d -o CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/threadaffinitytest.cpp

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/threadaffinitytest.cpp > CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.i

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/threadaffinitytest.cpp -o CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.s

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/flags.make
src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/unittest_main.cpp

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/unittest_main.cpp > CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.i

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/unittest_main.cpp -o CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target mdrunutility-test-shared
mdrunutility__test__shared_OBJECTS = \
"CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o" \
"CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target mdrunutility-test-shared
mdrunutility__test__shared_EXTERNAL_OBJECTS =

lib/libmdrunutility-test-shared.a: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/threadaffinitytest.cpp.o
lib/libmdrunutility-test-shared.a: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/__/__/__/testutils/unittest_main.cpp.o
lib/libmdrunutility-test-shared.a: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/build.make
lib/libmdrunutility-test-shared.a: src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../../../lib/libmdrunutility-test-shared.a"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && $(CMAKE_COMMAND) -P CMakeFiles/mdrunutility-test-shared.dir/cmake_clean_target.cmake
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mdrunutility-test-shared.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/build: lib/libmdrunutility-test-shared.a
.PHONY : src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/build

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/clean:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests && $(CMAKE_COMMAND) -P CMakeFiles/mdrunutility-test-shared.dir/cmake_clean.cmake
.PHONY : src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/clean

src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/depend:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pamella/Documentos/softwares/gromacs-2022.1 /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests /home/pamella/Documentos/softwares/gromacs-2022.1/build /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gromacs/mdrunutility/tests/CMakeFiles/mdrunutility-test-shared.dir/depend


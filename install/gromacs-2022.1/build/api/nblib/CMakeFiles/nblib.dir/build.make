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
include api/nblib/CMakeFiles/nblib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include api/nblib/CMakeFiles/nblib.dir/compiler_depend.make

# Include the progress variables for this target.
include api/nblib/CMakeFiles/nblib.dir/progress.make

# Include the compile flags for this target's objects.
include api/nblib/CMakeFiles/nblib.dir/flags.make

api/nblib/CMakeFiles/nblib.dir/box.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/box.cpp.o: ../api/nblib/box.cpp
api/nblib/CMakeFiles/nblib.dir/box.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object api/nblib/CMakeFiles/nblib.dir/box.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/box.cpp.o -MF CMakeFiles/nblib.dir/box.cpp.o.d -o CMakeFiles/nblib.dir/box.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/box.cpp

api/nblib/CMakeFiles/nblib.dir/box.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/box.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/box.cpp > CMakeFiles/nblib.dir/box.cpp.i

api/nblib/CMakeFiles/nblib.dir/box.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/box.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/box.cpp -o CMakeFiles/nblib.dir/box.cpp.s

api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o: ../api/nblib/gmxcalculatorcpu.cpp
api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o -MF CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o.d -o CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/gmxcalculatorcpu.cpp

api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/gmxcalculatorcpu.cpp > CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.i

api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/gmxcalculatorcpu.cpp -o CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.s

api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o: ../api/nblib/integrator.cpp
api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o -MF CMakeFiles/nblib.dir/integrator.cpp.o.d -o CMakeFiles/nblib.dir/integrator.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/integrator.cpp

api/nblib/CMakeFiles/nblib.dir/integrator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/integrator.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/integrator.cpp > CMakeFiles/nblib.dir/integrator.cpp.i

api/nblib/CMakeFiles/nblib.dir/integrator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/integrator.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/integrator.cpp -o CMakeFiles/nblib.dir/integrator.cpp.s

api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o: ../api/nblib/interactions.cpp
api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o -MF CMakeFiles/nblib.dir/interactions.cpp.o.d -o CMakeFiles/nblib.dir/interactions.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/interactions.cpp

api/nblib/CMakeFiles/nblib.dir/interactions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/interactions.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/interactions.cpp > CMakeFiles/nblib.dir/interactions.cpp.i

api/nblib/CMakeFiles/nblib.dir/interactions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/interactions.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/interactions.cpp -o CMakeFiles/nblib.dir/interactions.cpp.s

api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o: ../api/nblib/molecules.cpp
api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o -MF CMakeFiles/nblib.dir/molecules.cpp.o.d -o CMakeFiles/nblib.dir/molecules.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/molecules.cpp

api/nblib/CMakeFiles/nblib.dir/molecules.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/molecules.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/molecules.cpp > CMakeFiles/nblib.dir/molecules.cpp.i

api/nblib/CMakeFiles/nblib.dir/molecules.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/molecules.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/molecules.cpp -o CMakeFiles/nblib.dir/molecules.cpp.s

api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o: ../api/nblib/nbnxmsetuphelpers.cpp
api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o -MF CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o.d -o CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/nbnxmsetuphelpers.cpp

api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/nbnxmsetuphelpers.cpp > CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.i

api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/nbnxmsetuphelpers.cpp -o CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.s

api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o: ../api/nblib/particlesequencer.cpp
api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o -MF CMakeFiles/nblib.dir/particlesequencer.cpp.o.d -o CMakeFiles/nblib.dir/particlesequencer.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particlesequencer.cpp

api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/particlesequencer.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particlesequencer.cpp > CMakeFiles/nblib.dir/particlesequencer.cpp.i

api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/particlesequencer.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particlesequencer.cpp -o CMakeFiles/nblib.dir/particlesequencer.cpp.s

api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o: ../api/nblib/particletype.cpp
api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o -MF CMakeFiles/nblib.dir/particletype.cpp.o.d -o CMakeFiles/nblib.dir/particletype.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particletype.cpp

api/nblib/CMakeFiles/nblib.dir/particletype.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/particletype.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particletype.cpp > CMakeFiles/nblib.dir/particletype.cpp.i

api/nblib/CMakeFiles/nblib.dir/particletype.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/particletype.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/particletype.cpp -o CMakeFiles/nblib.dir/particletype.cpp.s

api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o: ../api/nblib/simulationstate.cpp
api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o -MF CMakeFiles/nblib.dir/simulationstate.cpp.o.d -o CMakeFiles/nblib.dir/simulationstate.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/simulationstate.cpp

api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/simulationstate.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/simulationstate.cpp > CMakeFiles/nblib.dir/simulationstate.cpp.i

api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/simulationstate.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/simulationstate.cpp -o CMakeFiles/nblib.dir/simulationstate.cpp.s

api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o: ../api/nblib/topologyhelpers.cpp
api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o -MF CMakeFiles/nblib.dir/topologyhelpers.cpp.o.d -o CMakeFiles/nblib.dir/topologyhelpers.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topologyhelpers.cpp

api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/topologyhelpers.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topologyhelpers.cpp > CMakeFiles/nblib.dir/topologyhelpers.cpp.i

api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/topologyhelpers.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topologyhelpers.cpp -o CMakeFiles/nblib.dir/topologyhelpers.cpp.s

api/nblib/CMakeFiles/nblib.dir/topology.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/topology.cpp.o: ../api/nblib/topology.cpp
api/nblib/CMakeFiles/nblib.dir/topology.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object api/nblib/CMakeFiles/nblib.dir/topology.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/topology.cpp.o -MF CMakeFiles/nblib.dir/topology.cpp.o.d -o CMakeFiles/nblib.dir/topology.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topology.cpp

api/nblib/CMakeFiles/nblib.dir/topology.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/topology.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topology.cpp > CMakeFiles/nblib.dir/topology.cpp.i

api/nblib/CMakeFiles/nblib.dir/topology.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/topology.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/topology.cpp -o CMakeFiles/nblib.dir/topology.cpp.s

api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o: ../api/nblib/tpr.cpp
api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o -MF CMakeFiles/nblib.dir/tpr.cpp.o.d -o CMakeFiles/nblib.dir/tpr.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/tpr.cpp

api/nblib/CMakeFiles/nblib.dir/tpr.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/tpr.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/tpr.cpp > CMakeFiles/nblib.dir/tpr.cpp.i

api/nblib/CMakeFiles/nblib.dir/tpr.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/tpr.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/tpr.cpp -o CMakeFiles/nblib.dir/tpr.cpp.s

api/nblib/CMakeFiles/nblib.dir/virials.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/virials.cpp.o: ../api/nblib/virials.cpp
api/nblib/CMakeFiles/nblib.dir/virials.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object api/nblib/CMakeFiles/nblib.dir/virials.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/virials.cpp.o -MF CMakeFiles/nblib.dir/virials.cpp.o.d -o CMakeFiles/nblib.dir/virials.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/virials.cpp

api/nblib/CMakeFiles/nblib.dir/virials.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/virials.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/virials.cpp > CMakeFiles/nblib.dir/virials.cpp.i

api/nblib/CMakeFiles/nblib.dir/virials.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/virials.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/virials.cpp -o CMakeFiles/nblib.dir/virials.cpp.s

api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o: ../api/nblib/listed_forces/calculator.cpp
api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o -MF CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o.d -o CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/calculator.cpp

api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/listed_forces/calculator.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/calculator.cpp > CMakeFiles/nblib.dir/listed_forces/calculator.cpp.i

api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/listed_forces/calculator.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/calculator.cpp -o CMakeFiles/nblib.dir/listed_forces/calculator.cpp.s

api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o: ../api/nblib/listed_forces/transformations.cpp
api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o -MF CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o.d -o CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/transformations.cpp

api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/listed_forces/transformations.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/transformations.cpp > CMakeFiles/nblib.dir/listed_forces/transformations.cpp.i

api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/listed_forces/transformations.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/transformations.cpp -o CMakeFiles/nblib.dir/listed_forces/transformations.cpp.s

api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o: ../api/nblib/listed_forces/conversions.cpp
api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o -MF CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o.d -o CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/conversions.cpp

api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/listed_forces/conversions.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/conversions.cpp > CMakeFiles/nblib.dir/listed_forces/conversions.cpp.i

api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/listed_forces/conversions.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/conversions.cpp -o CMakeFiles/nblib.dir/listed_forces/conversions.cpp.s

api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o: ../api/nblib/listed_forces/convertGmxToNblib.cpp
api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o -MF CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o.d -o CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/convertGmxToNblib.cpp

api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/convertGmxToNblib.cpp > CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.i

api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/convertGmxToNblib.cpp -o CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.s

api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o: api/nblib/CMakeFiles/nblib.dir/flags.make
api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o: ../api/nblib/util/setup.cpp
api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o: api/nblib/CMakeFiles/nblib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building CXX object api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o -MF CMakeFiles/nblib.dir/util/setup.cpp.o.d -o CMakeFiles/nblib.dir/util/setup.cpp.o -c /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/setup.cpp

api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib.dir/util/setup.cpp.i"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/setup.cpp > CMakeFiles/nblib.dir/util/setup.cpp.i

api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib.dir/util/setup.cpp.s"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/setup.cpp -o CMakeFiles/nblib.dir/util/setup.cpp.s

# Object files for target nblib
nblib_OBJECTS = \
"CMakeFiles/nblib.dir/box.cpp.o" \
"CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o" \
"CMakeFiles/nblib.dir/integrator.cpp.o" \
"CMakeFiles/nblib.dir/interactions.cpp.o" \
"CMakeFiles/nblib.dir/molecules.cpp.o" \
"CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o" \
"CMakeFiles/nblib.dir/particlesequencer.cpp.o" \
"CMakeFiles/nblib.dir/particletype.cpp.o" \
"CMakeFiles/nblib.dir/simulationstate.cpp.o" \
"CMakeFiles/nblib.dir/topologyhelpers.cpp.o" \
"CMakeFiles/nblib.dir/topology.cpp.o" \
"CMakeFiles/nblib.dir/tpr.cpp.o" \
"CMakeFiles/nblib.dir/virials.cpp.o" \
"CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o" \
"CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o" \
"CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o" \
"CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o" \
"CMakeFiles/nblib.dir/util/setup.cpp.o"

# External object files for target nblib
nblib_EXTERNAL_OBJECTS =

lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/box.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/gmxcalculatorcpu.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/integrator.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/interactions.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/molecules.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/nbnxmsetuphelpers.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/particlesequencer.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/particletype.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/simulationstate.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/topologyhelpers.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/topology.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/tpr.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/virials.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/listed_forces/calculator.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/listed_forces/transformations.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/listed_forces/conversions.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/listed_forces/convertGmxToNblib.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/util/setup.cpp.o
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/build.make
lib/libnblib_gmx.so.0.1.0: lib/libgromacs_mpi.so.7.0.0
lib/libnblib_gmx.so.0.1.0: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
lib/libnblib_gmx.so.0.1.0: /usr/lib/x86_64-linux-gnu/libpthread.a
lib/libnblib_gmx.so.0.1.0: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi_cxx.so
lib/libnblib_gmx.so.0.1.0: /usr/lib/x86_64-linux-gnu/openmpi/lib/libmpi.so
lib/libnblib_gmx.so.0.1.0: api/nblib/CMakeFiles/nblib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pamella/Documentos/softwares/gromacs-2022.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Linking CXX shared library ../../lib/libnblib_gmx.so"
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nblib.dir/link.txt --verbose=$(VERBOSE)
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libnblib_gmx.so.0.1.0 ../../lib/libnblib_gmx.so.0 ../../lib/libnblib_gmx.so

lib/libnblib_gmx.so.0: lib/libnblib_gmx.so.0.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libnblib_gmx.so.0

lib/libnblib_gmx.so: lib/libnblib_gmx.so.0.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libnblib_gmx.so

# Rule to build all files generated by this target.
api/nblib/CMakeFiles/nblib.dir/build: lib/libnblib_gmx.so
.PHONY : api/nblib/CMakeFiles/nblib.dir/build

api/nblib/CMakeFiles/nblib.dir/clean:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib && $(CMAKE_COMMAND) -P CMakeFiles/nblib.dir/cmake_clean.cmake
.PHONY : api/nblib/CMakeFiles/nblib.dir/clean

api/nblib/CMakeFiles/nblib.dir/depend:
	cd /home/pamella/Documentos/softwares/gromacs-2022.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pamella/Documentos/softwares/gromacs-2022.1 /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib /home/pamella/Documentos/softwares/gromacs-2022.1/build /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/CMakeFiles/nblib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : api/nblib/CMakeFiles/nblib.dir/depend


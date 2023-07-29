# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/fft/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/fft/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(FFTUnitTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/fft-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/FFTUnitTests.xml")
set_tests_properties(FFTUnitTests PROPERTIES  LABELS "GTest;SlowTest" TIMEOUT "480" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/fft/tests/CMakeLists.txt;41;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/fft/tests/CMakeLists.txt;0;")

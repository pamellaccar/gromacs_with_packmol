# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/testutils/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(TestUtilsUnitTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/testutils-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/TestUtilsUnitTests.xml")
set_tests_properties(TestUtilsUnitTests PROPERTIES  LABELS "GTest;UnitTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;307;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/tests/CMakeLists.txt;0;")
add_test(TestUtilsMpiUnitTests "/usr/bin/mpiexec" "-n" "2" "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/testutils-mpi-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/TestUtilsMpiUnitTests.xml")
set_tests_properties(TestUtilsMpiUnitTests PROPERTIES  LABELS "GTest;UnitTest;MpiTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;313;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/tests/CMakeLists.txt;43;gmx_add_mpi_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/tests/CMakeLists.txt;0;")

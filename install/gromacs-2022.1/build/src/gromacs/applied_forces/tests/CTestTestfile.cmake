# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/applied_forces/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/applied_forces/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(AppliedForcesUnitTest "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/applied_forces-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/AppliedForcesUnitTest.xml")
set_tests_properties(AppliedForcesUnitTest PROPERTIES  LABELS "GTest;UnitTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;307;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/applied_forces/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/applied_forces/tests/CMakeLists.txt;0;")

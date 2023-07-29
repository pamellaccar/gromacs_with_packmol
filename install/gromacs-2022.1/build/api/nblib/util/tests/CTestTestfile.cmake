# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/util/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(NbLibUtilTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/nblib-util-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/NbLibUtilTests.xml")
set_tests_properties(NbLibUtilTests PROPERTIES  LABELS "GTest;UnitTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/tests/CMakeLists.txt;50;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/util/tests/CMakeLists.txt;0;")

# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdlib/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdlib/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(MdlibUnitTest "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/mdlib-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/MdlibUnitTest.xml")
set_tests_properties(MdlibUnitTest PROPERTIES  LABELS "GTest;UnitTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;307;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdlib/tests/CMakeLists.txt;34;gmx_add_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdlib/tests/CMakeLists.txt;0;")

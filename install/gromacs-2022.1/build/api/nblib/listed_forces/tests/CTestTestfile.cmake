# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/nblib/listed_forces/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(NbLibListedForcesTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/nblib-listed-forces-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/NbLibListedForcesTests.xml")
set_tests_properties(NbLibListedForcesTests PROPERTIES  LABELS "GTest;IntegrationTest" TIMEOUT "120" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/tests/CMakeLists.txt;61;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/nblib/listed_forces/tests/CMakeLists.txt;0;")

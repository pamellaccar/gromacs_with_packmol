# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/src/gromacs/mdrunutility/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(MdrunUtilityUnitTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/mdrunutility-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/MdrunUtilityUnitTests.xml")
set_tests_properties(MdrunUtilityUnitTests PROPERTIES  LABELS "GTest;UnitTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;307;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/CMakeLists.txt;39;gmx_add_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/CMakeLists.txt;0;")
add_test(MdrunUtilityMpiUnitTests "/usr/bin/mpiexec" "-n" "4" "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/mdrunutility-mpi-test" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/MdrunUtilityMpiUnitTests.xml")
set_tests_properties(MdrunUtilityMpiUnitTests PROPERTIES  LABELS "GTest;UnitTest;MpiTest" TIMEOUT "30" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;313;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/CMakeLists.txt;45;gmx_add_mpi_unit_test;/home/pamella/Documentos/softwares/gromacs-2022.1/src/gromacs/mdrunutility/tests/CMakeLists.txt;0;")

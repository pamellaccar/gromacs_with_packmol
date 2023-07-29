# CMake generated Testfile for 
# Source directory: /home/pamella/Documentos/softwares/gromacs-2022.1/api/gmxapi/cpp/tests
# Build directory: /home/pamella/Documentos/softwares/gromacs-2022.1/build/api/gmxapi/cpp/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(GmxapiExternalInterfaceTests "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/gmxapi-test" "-ntomp" "2" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/GmxapiExternalInterfaceTests.xml")
set_tests_properties(GmxapiExternalInterfaceTests PROPERTIES  LABELS "GTest;IntegrationTest" TIMEOUT "120" WORKING_DIRECTORY "/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/gmxapi/cpp/tests" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/gmxapi/cpp/tests/CMakeLists.txt;69;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/gmxapi/cpp/tests/CMakeLists.txt;0;")
add_test(GmxapiMpiTests "/usr/bin/mpiexec" "-n" "2" "/home/pamella/Documentos/softwares/gromacs-2022.1/build/bin/gmxapi-mpi-test" "-ntomp" "2" "--gtest_output=xml:/home/pamella/Documentos/softwares/gromacs-2022.1/build/Testing/Temporary/GmxapiMpiTests.xml")
set_tests_properties(GmxapiMpiTests PROPERTIES  LABELS "GTest;IntegrationTest;MpiTest" TIMEOUT "120" WORKING_DIRECTORY "/home/pamella/Documentos/softwares/gromacs-2022.1/build/api/gmxapi/cpp/tests" _BACKTRACE_TRIPLES "/home/pamella/Documentos/softwares/gromacs-2022.1/src/testutils/TestMacros.cmake;297;add_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/gmxapi/cpp/tests/CMakeLists.txt;102;gmx_register_gtest_test;/home/pamella/Documentos/softwares/gromacs-2022.1/api/gmxapi/cpp/tests/CMakeLists.txt;0;")

file(REMOVE_RECURSE
  "../../bin/gmx_mpi"
  "../../bin/gmx_mpi.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/gmx.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

file(REMOVE_RECURSE
  "CMakeFiles/ocl_pme_kernels"
  "pme_ocl_kernel_warpSize16_AMD.o"
  "pme_ocl_kernel_warpSize16_INTEL.o"
  "pme_ocl_kernel_warpSize16_NVIDIA.o"
  "pme_ocl_kernel_warpSize32_AMD.o"
  "pme_ocl_kernel_warpSize32_INTEL.o"
  "pme_ocl_kernel_warpSize32_NVIDIA.o"
  "pme_ocl_kernel_warpSize64_AMD.o"
  "pme_ocl_kernel_warpSize64_INTEL.o"
  "pme_ocl_kernel_warpSize64_NVIDIA.o"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/ocl_pme_kernels.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()

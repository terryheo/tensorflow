# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(gemmlowp)
if(gemmlowp_POPULATED)
  set(GEMMLOWP_FOUND TRUE)
  get_target_property(GEMMLOWP_INCLUDE_DIRS gemmlowp INTERFACE_DIRECTORIES)
  set(GEMMLOWP_LIBRARIES
    gemmlowp
    gemmlowp_fixedpoint
    gemmlowp_profiler
    gemmlowp_eight_bit_int_gemm
  )
endif()


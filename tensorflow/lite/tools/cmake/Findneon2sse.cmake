# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(neon2sse)
if(neon2sse_POPULATED)
  set(NEON2SSE_FOUND TRUE)
  get_target_property(NEON2SSE_INCLUDE_DIRS NEON_2_SSE INTERFACE_DIRECTORIES)
  set(NEON2SSE_LIBRARIES NEON_2_SSE)
endif()

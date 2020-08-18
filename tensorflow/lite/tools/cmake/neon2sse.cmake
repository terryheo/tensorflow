include(ExternalProject)

if(TARGET neon2sse OR neon2sse_POPULATED)
  return()
endif()

OverridableFetchContent_Declare(
  neon2sse
  GIT_REPOSITORY https://github.com/intel/ARM_NEON_2_x86_SSE
  GIT_TAG master
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_BINARY_DIR}/neon2sse"
)

OverridableFetchContent_GetProperties(neon2sse)
if(NOT neon2sse_POPULATED)
  OverridableFetchContent_Populate(neon2sse)
endif()

add_subdirectory(
  "${neon2sse_SOURCE_DIR}"
  "${neon2sse_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)

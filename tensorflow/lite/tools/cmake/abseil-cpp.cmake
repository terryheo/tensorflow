# Use absl_base as a proxy for the project being included.
if(TARGET absl_base OR abseil-cpp_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  abseil-cpp
  GIT_REPOSITORY https://github.com/abseil/abseil-cpp
  GIT_TAG 20200225.2 # TODO: What version does GRPC and TFLite need?
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  PREFIX "${CMAKE_BINARY_DIR}"
  SOURCE_DIR "${CMAKE_BINARY_DIR}/abseil-cpp"
)
OverridableFetchContent_GetProperties(abseil-cpp)
if(NOT abseil-cpp_POPULATED)
  OverridableFetchContent_Populate(abseil-cpp)
endif()

set(ABSL_USE_GOOGLETEST_HEAD OFF CACHE BOOL "Disable googletest")
set(ABSL_RUN_TESTS OFF CACHE BOOL "Disable build of ABSL tests")
add_subdirectory(
  "${abseil-cpp_SOURCE_DIR}"
  "${abseil-cpp_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)


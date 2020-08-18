if(TARGET gemmlowp OR gemmlowp_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  gemmlowp
  GIT_REPOSITORY https://github.com/google/gemmlowp
  GIT_TAG fda83bdc38b118cc6b56753bd540caa49e570745
  # It's not currently (cmake 3.17) possible to shallow clone with a GIT TAG
  # as cmake attempts to git checkout the commit hash after the clone
  # which doesn't work as it's a shallow clone hence a different commit hash.
  # https://gitlab.kitware.com/cmake/cmake/-/issues/17770
  # GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_BINARY_DIR}/gemmlowp"
)

OverridableFetchContent_GetProperties(gemmlowp)
if(NOT gemmlowp_POPULATED)
  OverridableFetchContent_Populate(gemmlowp)
endif()

set(GEMMLOWP_SOURCE_DIR "${gemmlowp_SOURCE_DIR}" CACHE PATH "Source directory")
add_subdirectory(
  "${CMAKE_CURRENT_LIST_DIR}/gemmlowp"
  "${gemmlowp_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)

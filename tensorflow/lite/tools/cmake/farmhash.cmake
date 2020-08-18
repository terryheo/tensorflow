if(TARGET farmhash OR farmhash_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  farmhash
  GIT_REPOSITORY https://github.com/google/farmhash
  # TODO: Reference the source of this.
  GIT_TAG 816a4ae622e964763ca0862d9dbd19324a1eaf45
  # It's not currently possible to shallow clone with a GIT TAG
  # as cmake attempts to git checkout the commit hash after the clone
  # which doesn't work as it's a shallow clone hence a different commit hash.
  # https://gitlab.kitware.com/cmake/cmake/-/issues/17770
  # GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_BINARY_DIR}/farmhash"
)
OverridableFetchContent_GetProperties(farmhash)
if(NOT farmhash_POPULATED)
  OverridableFetchContent_Populate(farmhash)
endif()

set(FARMHASH_SOURCE_DIR "${farmhash_SOURCE_DIR}" CACHE PATH
  "Source directory for the CMake project."
)

add_subdirectory(
  "${CMAKE_CURRENT_LIST_DIR}/farmhash"
  "${farmhash_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)

if(TARGET ruy OR ruy_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  ruy
  GIT_REPOSITORY https://github.com/google/ruy
  GIT_TAG master # TODO
  GIT_SHALLOW TRUE
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_BINARY_DIR}/ruy"
)
OverridableFetchContent_GetProperties(ruy)
if(NOT ruy_POPULATED)
  OverridableFetchContent_Populate(ruy)
endif()

set(RUY_SOURCE_DIR "${ruy_SOURCE_DIR}" CACHE PATH "RUY source directory")

add_subdirectory(
  "${CMAKE_CURRENT_LIST_DIR}/ruy"
  "${ruy_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)

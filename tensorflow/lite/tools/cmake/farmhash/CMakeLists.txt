project(farmhash CXX)

set(FARMHASH_SOURCE_DIR "" CACHE PATH
  "Directory that contains the farmhash project"
)
if(NOT FARMHASH_SOURCE_DIR)
  message(FATAL_ERROR "Must specify source directory")
endif()

# Transcribed from farmhash/src/Makefile.am
include(CheckCXXSourceCompiles)
check_cxx_source_compiles(
  "int main(int argc, char* argv[]) { return (int)__builtin_expect(0, 0); }"
  FARMHASH_HAS_BUILTIN_EXPECT
)

add_library(farmhash
  "${FARMHASH_SOURCE_DIR}/src/farmhash.cc"
  "${FARMHASH_SOURCE_DIR}/src/farmhash.h"
)
target_include_directories(farmhash PUBLIC "${FARMHASH_SOURCE_DIR}/src")
if(NOT FARMHASH_HAS_BUILTIN_EXPECT)
  target_compile_definitions(farmhash PUBLIC -DFARMHASH_NO_BUILTIN_EXPECT)
endif()

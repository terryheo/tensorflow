# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(farmhash)
if(farmhash_POPULATED)
  set(FARMHASH_FOUND TRUE)
  get_target_property(FARMHASH_INCLUDE_DIRS farmhash INTERFACE_DIRECTORIES)
  add_library(farmhash::farmhash ALIAS farmhash)
  set(FARMHASH_LIBRARIES farmhash::farmhash)
endif()


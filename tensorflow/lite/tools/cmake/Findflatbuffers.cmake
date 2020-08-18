# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(flatbuffers)
if(flatbuffers_POPULATED)
  set(FLATBUFFERS_FOUND TRUE)
  get_target_property(FLATBUFFERS_INCLUDE_DIRS flatbuffers INCLUDE_DIRECTORIES)
  set(FLATBUFFERS_LIBRARIES flatbuffers)
  set(FLATBUFFERS_PROJECT_DIR "${flatbuffers_SOURCE_DIR}" CACHE STRING
    "Flatbuffers project dir"
  )
endif()


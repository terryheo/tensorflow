# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(eigen)
if(eigen_POPULATED)
  set(EIGEN_FOUND TRUE)
  get_target_property(EIGEN_INCLUDE_DIRS eigen INTERFACE_DIRECTORIES)
  set(EIGEN_LIBRARIES Eigen3::Eigen)
endif()


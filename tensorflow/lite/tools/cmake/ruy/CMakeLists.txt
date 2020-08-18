cmake_minimum_required(VERSION 3.17)

project(ruy CXX)

set(CMAKE_CXX_STANDARD 14)  # Some components require C++14.
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(RUY_SOURCE_DIR "" CACHE PATH
  "Directory that contains the RUY project"
)
if(NOT RUY_SOURCE_DIR)
  message(FATAL_ERROR "Must specify source directory")
endif()

file(GLOB RUY_SOURCES "${RUY_SOURCE_DIR}/ruy/*.*")
list(FILTER RUY_SOURCES INCLUDE REGEX ".*\\.(c|cc|h)$")
list(FILTER RUY_SOURCES EXCLUDE REGEX ".*(_test)\\.(c|cc|h)$")
list(FILTER RUY_SOURCES EXCLUDE REGEX ".*/(benchmark|example|test_.*)\.cc$")
list(FILTER RUY_SOURCES EXCLUDE REGEX ".*/gtest_wrapper\\.h$")

add_library(ruy ${RUY_SOURCES})
target_include_directories(ruy PUBLIC "${RUY_SOURCE_DIR}")


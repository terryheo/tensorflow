if(TARGET fft2d OR fft2d_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  fft2d
  URL https://storage.googleapis.com/mirror.tensorflow.org/www.kurims.kyoto-u.ac.jp/~ooura/fft2d.tgz
  # TODO: Reference where this comes from.
  URL_HASH SHA256=ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9
  SOURCE_DIR "${CMAKE_BINARY_DIR}/fft2d"
  LICENSE_FILE "readme2d.txt"
  LICENSE_URL "http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html"
)
OverridableFetchContent_GetProperties(fft2d)
if(NOT fft2d_POPULATED)
  OverridableFetchContent_Populate(fft2d)
endif()

set(FFT2D_SOURCE_DIR "${fft2d_SOURCE_DIR}" CACHE PATH "fft2d source")
add_subdirectory(
  "${CMAKE_CURRENT_LIST_DIR}/fft2d"
  "${fft2d_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)

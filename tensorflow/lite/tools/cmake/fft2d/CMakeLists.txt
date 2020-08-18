project(fft2d C)

set(FFT2D_SOURCE_DIR "" CACHE PATH
  "Directory that contains the fft2d project"
)
if(NOT FFT2D_SOURCE_DIR)
  message(FATAL_ERROR "Must specify source directory")
endif()

# fft2d doesn't have a CMake project so define it here transcribed from
# sample2d/Makefile.

# A developer should link this library if they haven't provided their own
# implementation of these allocation methods.
add_library(fft2d_alloc
  "${FFT2D_SOURCE_DIR}/alloc.c"
  "${FFT2D_SOURCE_DIR}/alloc.h"
)
target_include_directories(fft2d_alloc PUBLIC "${FFT2D_SOURCE_DIR}")

# Requires implementation of fft2d_alloc.
add_library(fft2d_fft4f2d "${FFT2D_SOURCE_DIR}/fft4f2d.c")
target_include_directories(fft2d_fft4f2d PRIVATE "${FFT2D_SOURCE_DIR}")

add_library(fft2d_fftsg "${FFT2D_SOURCE_DIR}/fftsg.c")

# Requires implementation of fft2d_alloc.
add_library(fft2d_fftsg2d "${FFT2D_SOURCE_DIR}/fftsg2d.c")
target_link_libraries(fft2d_fftsg2d fft2d_fftsg)
target_include_directories(fft2d_fftsg2d PRIVATE "${FFT2D_SOURCE_DIR}")

# Requires implementation of fft2d_alloc.
add_library(fft2d_fftsg3d "${FFT2D_SOURCE_DIR}/fftsg3d.c")
target_link_libraries(fft2d_fftsg3d fft2d_fftsg)
target_include_directories(fft2d_fftsg3d PRIVATE "${FFT2D_SOURCE_DIR}")

add_library(fft2d_shrtdct "${FFT2D_SOURCE_DIR}/shrtdct.c")

# TODO(smiles): REMOVE and depend upon the library we really need.
# fft2d doesn't have a CMake project so define the target here.
#set(FFT2D_SRCS
#  "${FFT2D_SOURCE_DIR}/fftsg.c"
#  "${FFT2D_SOURCE_DIR}/fftsg2d.c"
#)
#add_library(fft2d ${FFT2D_SRCS})
add_library(fft2d ALIAS fft2d_fftsg2d)

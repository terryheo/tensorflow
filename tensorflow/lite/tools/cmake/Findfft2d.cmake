# tensorflow-lite uses find_package for this package, so override the system
# installation and build from source instead.
include(fft2d)
if(fft2d_POPULATED)
  set(FFT2D_FOUND TRUE CACHE BOOL "Found FF2D")
  get_target_property(FFT2D_INCLUDE_DIRS fft2d INCLUDE_DIRECTORIES)
  set(FFT2D_INCLUDE_DIRS ${FFT2D_INCLUDE_DIRS} CACHE STRING
    "FFT2D include dirs"
  )
  set(FFT2D_LIBRARIES
    fft2d_alloc
    fft2d_fft4f2d
    fft2d_fftsg
    fft2d_fftsg2d
    fft2d_fftsg3d
    fft2d_shrtdct
    CACHE
    STRING
    "FFT2D libraries"
  )
endif()


include(FetchContent)

FetchContent_Declare(
  libconfuse
  GIT_REPOSITORY https://github.com/I-A-S/libconfuse-cmake.git
  GIT_TAG main
  OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(libconfuse)

FetchContent_Declare(
  LibUSB1
  GIT_REPOSITORY  https://github.com/libusb/libusb-cmake.git
  GIT_TAG main
  OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(LibUSB1)

if(WIN32 AND CMAKE_C_COMPILER_ID MATCHES "Clang" AND TARGET usb-1.0)
  # Silence noisy third-party warnings from vendored libusb when using clang on Windows.
  target_compile_options(usb-1.0 PRIVATE
    -Wno-unused-value
    -Wno-pragma-pack
    -Wno-deprecated-declarations
  )
endif()

link_libraries(libconfuse usb-1.0)


# Try to find Wayland on a Unix system
#
# This will define:
#
#   WAYLAND_FOUND        - True if Wayland is found
#   WAYLAND_LIBRARIES    - Link these to use Wayland
#   WAYLAND_INCLUDE_DIRS - Include directories for Wayland
#   WAYLAND_DEFINITIONS  - Compiler flags for using Wayland
#
# In addition the following more fine grained variables will be defined:
#
#   WAYLAND_CLIENT_FOUND  WAYLAND_CLIENT_INCLUDE_DIRS  WAYLAND_CLIENT_LIBRARIES
#   WAYLAND_SERVER_FOUND  WAYLAND_SERVER_INCLUDE_DIRS  WAYLAND_SERVER_LIBRARIES
#   WAYLAND_EGL_FOUND     WAYLAND_EGL_INCLUDE_DIRS     WAYLAND_EGL_LIBRARIES
#
# Copyright (c) 2015 Jari Vetoniemi
#               2013 Martin Gräßlin <mgraesslin@kde.org>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

find_package(PkgConfig)
pkg_check_modules(PC_WAYLAND REQUIRED QUIET wayland-client>=1.7 wayland-server>=1.7 wayland-egl)

find_library(WAYLAND_CLIENT_LIBRARIES NAMES wayland-client   HINTS ${PC_WAYLAND_LIBRARY_DIRS})
find_library(WAYLAND_SERVER_LIBRARIES NAMES wayland-server   HINTS ${PC_WAYLAND_LIBRARY_DIRS})
find_library(WAYLAND_EGL_LIBRARIES    NAMES wayland-egl      HINTS ${PC_WAYLAND_LIBRARY_DIRS})

find_path(WAYLAND_CLIENT_INCLUDE_DIRS  NAMES wayland-client.h HINTS ${PC_WAYLAND_INCLUDE_DIRS})
find_path(WAYLAND_SERVER_INCLUDE_DIRS  NAMES wayland-server.h HINTS ${PC_WAYLAND_INCLUDE_DIRS})
find_path(WAYLAND_EGL_INCLUDE_DIRS     NAMES wayland-egl.h    HINTS ${PC_WAYLAND_INCLUDE_DIRS})

set(WAYLAND_INCLUDE_DIRS ${WAYLAND_CLIENT_INCLUDE_DIRS} ${WAYLAND_SERVER_INCLUDE_DIRS} ${WAYLAND_EGL_INCLUDE_DIRS})
set(WAYLAND_LIBRARIES ${WAYLAND_CLIENT_LIBRARIES} ${WAYLAND_SERVER_LIBRARIES} ${WAYLAND_EGL_LIBRARIES})
set(WAYLAND_DEFINITIONS ${PC_WAYLAND_CFLAGS})

list(REMOVE_DUPLICATES WAYLAND_INCLUDE_DIRS)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(WAYLAND_CLIENT  DEFAULT_MSG  WAYLAND_CLIENT_LIBRARIES  WAYLAND_CLIENT_INCLUDE_DIRS)
find_package_handle_standard_args(WAYLAND_SERVER  DEFAULT_MSG  WAYLAND_SERVER_LIBRARIES  WAYLAND_SERVER_INCLUDE_DIRS)
find_package_handle_standard_args(WAYLAND_EGL     DEFAULT_MSG  WAYLAND_EGL_LIBRARIES     WAYLAND_EGL_INCLUDE_DIRS)
find_package_handle_standard_args(WAYLAND         DEFAULT_MSG  WAYLAND_LIBRARIES         WAYLAND_INCLUDE_DIRS)

mark_as_advanced(
  WAYLAND_INCLUDE_DIRS         WAYLAND_LIBRARIES
  WAYLAND_CLIENT_INCLUDE_DIRS  WAYLAND_CLIENT_LIBRARIES
  WAYLAND_SERVER_INCLUDE_DIRS  WAYLAND_SERVER_LIBRARIES
  WAYLAND_EGL_INCLUDE_DIRS     WAYLAND_EGL_LIBRARIES
  )

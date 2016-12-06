#!/bin/bash

# baseline software spec-s
export PROJECT_DIR=$(pwd)
export OPENCV_VER="opencv-3.1.0"
export BROOT_VER="buildroot-2016.08.1"
export ZLIB_VER="zlib-1.2.8"
export LIBJPEG_VER="jpeg-9b"
export LIBTIFF_VER="tiff-3.8.2"
export LIBPNG_VER="libpng-1.6.26"
export WEBPLIB_VER="libwebp-0.5.1"
export BASEEXR_VER="ilmbase-2.2.0"
export OPENEXR_VER="openexr-2.2.0"
export JPEG2000_VER="jasper-2.0.0"

# project structure
export ARCH_DIR=$PROJECT_DIR/"Archive"
export MEDIA_DIR=$PROJECT_DIR/"Media"
# x86 libs
export LIBX86_DIR=$PROJECT_DIR/"LibX86"
export OPENCV_X86_DIR=$LIBX86_DIR/"opencv"
export ZLIB_X86_DIR=$LIBX86_DIR/"z"
export PNG_X86_DIR=$LIBX86_DIR/"png"
export JPEG_X86_DIR=$LIBX86_DIR/"jpeg"
export TIFF_X86_DIR=$LIBX86_DIR/"tiff"
export WEBP_X86_DIR=$LIBX86_DIR/"webp"
# BASEEXPR_X86_DIR
# OPENEXPR_X86_DIR
export JPEG2000_X86_DIR=$LIBX86_DIR/"jpeg2000"
# arm libs
export LIBARM_DIR=$PROJECT_DIR/"LibARM"
export OPENCV_ARM_DIR=$LIBARM_DIR/"opencv"
export ZLIB_ARM_DIR=$LIBARM_DIR/"z"
export PNG_ARM_DIR=$LIBARM_DIR/"png"
export JPEG_ARM_DIR=$LIBARM_DIR/"jpeg"
export TIFF_ARM_DIR=$LIBARM_DIR/"tiff"
export WEBP_ARM_DIR=$LIBARM_DIR/"webp"
export BASEEXR_ARM_DIR=$LIBARM_DIR/"baseexr"
export OPENEXR_ARM_DIR=$LIBARM_DIR/"openexr"
export JPEG2000_ARM_DIR=$LIBARM_DIR/"jpeg2000"
# others
export BROOT_DIR=$PROJECT_DIR/"Buildroot"
export TOOLCH_DIR=$PROJECT_DIR/"Toolchain"

# export toolchain to PATH
export PATH=$PATH:$TOOLCH_DIR/bin

# export client library
export LD_LIBRARY_PATH=$OPENCV_X86_DIR/lib

#!/usr/bin/env bash

# change working directory
cd /usr/src/kernel 

ARCH=arm64
ANDROID_MAJOR_VERSION="r"
ARCH=arm64
PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION ARCH PLATFORM_VERSION

BUILD_CROSS_COMPILE="/opt/aarch64-linux-android-4.9/bin/aarch64-linux-android-"
KERNEL_LLVM_BIN="/opt/llvm/bin/clang"
CLANG_TRIPLE="aarch64-linux-gnu-"
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

mkdir -p out/

make -C $(pwd) \
  O=$(pwd)/out \
  $KERNEL_MAKE_ENV \
  CROSS_COMPILE=$BUILD_CROSS_COMPILE \
  REAL_CC=$KERNEL_LLVM_BIN \
  CLANG_TRIPLE=$CLANG_TRIPLE \
  vendor/c2q_chn_openx_defconfig

make -C $(pwd) \
  O=$(pwd)/out \
  $KERNEL_MAKE_ENV \
  CROSS_COMPILE=$BUILD_CROSS_COMPILE \
  REAL_CC=$KERNEL_LLVM_BIN \
  CLANG_TRIPLE=$CLANG_TRIPLE \
  menuconfig

# remove previous defconfig
rm -f /out/defconfig

# copy defconfig out
cp -fv \
  /usr/src/kernel/out/.config \
  /out/defconfig

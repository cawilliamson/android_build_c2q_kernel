#!/usr/bin/env bash

# change working directory
cd /usr/src/kernel

# symlink toolchain (installed at /opt)
ln -s /opt/toolchain /usr/src/kernel/toolchain

# execute actual build
bash build_kernel.sh

# remove previous images
rm -f /out/Image

# copy kernel image out
cp -fv \
  /usr/src/kernel/arch/arm64/boot/Image \
  /out/Image

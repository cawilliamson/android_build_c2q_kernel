#!/usr/bin/env bash

# change working directory
cd /usr/src/kernel

# execute actual build
bash build_kernel.sh

# remove previous images
rm -f /out/Image-dtb

# copy kernel image out
cp -fv \
  /usr/src/kernel/arch/arm64/boot/Image-dtb \
  /out/Image-dtb

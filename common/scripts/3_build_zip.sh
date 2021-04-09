#!/usr/bin/env bash

# fetch anykernel3 sources
git clone \
  https://github.com/osm0sis/AnyKernel3.git \
  /usr/src/anykernel3

# create config
cp -fv /common/configs/anykernel.sh /usr/src/anykernel3/anykernel.sh

# copy kernel image
cp -fv \
  /usr/src/kernel/arch/arm64/boot/Image-dtb \
  /usr/src/anykernel3/zImage

# cleanup previous zips
rm -f /out/*.zip

# create zip file
pushd /usr/src/anykernel3
  zip -r9 /out/leanKernel.zip * -x .git README.md *placeholder
popd

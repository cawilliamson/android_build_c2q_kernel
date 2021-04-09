#!/usr/bin/env bash

# fetch kernel sources
git clone \
  -b ${1:-master} \
  https://github.com/cawilliamson/android_kernel_samsung_c2s \
  /usr/src/kernel

FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install \
  bc \
  bison \
  build-essential \
  cpio \
  curl \
  flex \
  git \
  kmod \
  libncurses5 \
  libncurses-dev \
  libssl-dev \
  python \ 
  python3 \
  python3-pip \
  wget \
  xz-utils \
  zip

RUN git clone \
  --depth=1 \
  https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 \
  /opt/aarch64-linux-android-4.9

RUN git clone \
  --depth=1 \
  https://github.com/P-404/proprietary_vendor_qcom_sdclang.git \
  /opt/llvm

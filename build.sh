#!/bin/bash
#
# Compile script for Hydrogen kernel
# Brought to you by rio004 
#

# Date/Time
SECONDS=0
DATE=$(date '+%Y%m%d-%H%M')

# Device
DEVICE="duchamp"
DEFCONFIG="gki_defconfig"

sudo apt update && sudo apt install -y \
    android-sdk-libsparse-utils bc bison build-essential cpio curl default-jdk \
    device-tree-compiler erofs-utils flex g++ gcc git gnupg gperf grep kmod \
    libarchive-tools libc6-dev libelf-dev libgl1 libgl1-mesa-dev libncurses-dev \
    libreadline-dev libssl-dev libtinfo6 libx11-dev libxml2-utils lz4 make \
    openjdk-17-jdk openssl p7zip-full pahole python-is-python3 python3 \
    python3-markdown sudo tofrodos xsltproc xz-utils zlib1g-dev zstd \
    --fix-missing && touch .requirements

# Some additional info
echo -e "Building for: $DEVICE\n"

# Ensure the toolchain is available
TC_DIR="$HOME/toolchains/neutron-clang"
CURRENT_DIR=$(pwd)
if [ ! -d "$TC_DIR" ]; then
    mkdir -p $TC_DIR
    cd $TC_DIR
    bash <(curl -s "https://raw.githubusercontent.com/Neutron-Toolchains/antman/main/antman") -S=11032023
    cd $CURRENT_DIR
fi
export PATH="$TC_DIR/bin:$PATH"

# Set cross-compile environment variables
export BUILD_CC="$TC_DIR/bin/clang"

# Build options for the kernel
export BUILD_OPTIONS="
-C $CURRENT_DIR \
O=$CURRENT_DIR/out \
-j$(nproc) \
ARCH=arm64 \
CROSS_COMPILE=aarch64-linux-gnu- \
CLANG_TRIPLE=aarch64-linux-gnu- \
CC=${BUILD_CC} \
LLVM=1 \
LLVM_IAS=1 \
AR=$TC_DIR/bin/llvm-ar \
NM=$TC_DIR/bin/llvm-nm \
LD=$TC_DIR/bin/ld.lld \
STRIP=$TC_DIR/bin/llvm-strip \
OBJCOPY=$TC_DIR/bin/llvm-objcopy \
OBJDUMP=$TC_DIR/bin/llvm-objdump \
READELF=$TC_DIR/bin/llvm-readelf \
HOSTCC=$TC_DIR/bin/clang \
HOSTCXX=$TC_DIR/bin/clang++ \
KBUILD_BUILD_USER=HandingSlider
KBUILD_BUILD_HOST=Server
"
mkdir -p out
make ${BUILD_OPTIONS} $DEFCONFIG

echo -e "\nStarting compilation...\n"
make ${BUILD_OPTIONS} Image


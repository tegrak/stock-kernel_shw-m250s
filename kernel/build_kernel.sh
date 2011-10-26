#!/bin/bash

# TODO: Set toolchain and root filesystem path
TOOLCHAIN="/opt/toolchains/arm-eabi-4.4.0/bin/arm-eabi-"

# Copy Kernel Configuration File
cp -f arch/arm/configs/c1_defconfig .config

make oldconfig || exit -1
make ARCH=arm CROSS_COMPILE=$TOOLCHAIN || exit -1

# Copy Kernel Image
cp -f arch/arm/boot/zImage ../

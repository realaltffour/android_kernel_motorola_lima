#!/bin/bash

[ -d "out" ] && rm -rf out || mkdir -p out

make O=out ARCH=arm64 lima_defconfig

PATH="/home/akham/proj/google/arm64/bin:/home/akham/proj/gogole/arm32/bin:${PATH}" \
make                  O=out \
                      ARCH=arm64 \
                      CROSS_COMPILE=aarch64-linux-android- \
                      CROSS_COMPILE_ARM32=arm-linux-androideabi- \
                      CONFIG_NO_ERROR_ON_MISMATCH=y \
                      -j8

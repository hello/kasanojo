#!/bin/bash

SYSROOT=/home/hello/kasa/ambarella/out/hawthorn/fakeroot

TOOLCHAIN=/usr/local/linaro-armv7ahf-2015.11-gcc5.2/bin/arm-linux-gnueabihf-gcc

env CGO_ENABLED=1 C_INCLUDE_PATH=$SYSROOT/usr/include/ LIBRARY_PATH=$SYSROOT/usr/lib CC=$TOOLCHAIN PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig/ GOOS=linux GOARCH=arm GOARM=7 go get github.com/pebbe/zmq4

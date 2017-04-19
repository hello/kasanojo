#!/bin/bash
set -e

echo Building Hawthorn 
cd /home/hello/kasa/ambarella/boards/hawthorn
make sync_build_mkcfg
make s2l_ipcam_config 
make defconfig_public_linux
make -j $(nproc)

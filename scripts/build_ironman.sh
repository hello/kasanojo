#!/bin/bash
set -e

echo Building Ironman
cd /home/hello/kasa/ambarella/boards/s2lm_ironman
make sync_build_mkcfg
make s2lm_ironman_config
make defconfig_public_linux
make -j $(nproc)

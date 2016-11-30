#!/bin/bash

# get global config
source ExportGlobalVaribles.sh

cd /$PROJECT_DIR && mkdir -p ./$OPENCV_DIR
cd /tmp && tar -xzf /$PROJECT_DIR/$ARCH_DIR/$BROOT_VER.tar.gz

# use to edit buildroot configuration file
# sudo apt-get install libncurses-dev
# make menuconfig

cd ./$BROOT_VER
make

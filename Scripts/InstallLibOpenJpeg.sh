#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $JPEG2000_ARM_DIR
cd /tmp && tar -xzvf $ARCH_DIR/$JPEG2000_VER.tar.gz && cd ./$JPEG2000_VER

export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++
cmake -D CMAKE_BUILD_TYPE=Release \
	-D JAS_ENABLE_SHARED=true \
	-D ALLOW_IN_SOURCE_BUILD=ON \
	-D CMAKE_INSTALL_PREFIX=$JPEG2000_ARM_DIR ./

make && make install

# clean tmp
cd .. && rm -fr ./$JPEG2000_VER

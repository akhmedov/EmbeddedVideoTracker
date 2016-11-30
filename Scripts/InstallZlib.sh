#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $ZLIB_ARM_DIR
cd /tmp && tar -xzvf $ARCH_DIR/$ZLIB_VER.tar.gz

# configurate for ARM
cd ./$ZLIB_VER
export CC=arm-linux-gnueabihf-gcc
./configure --prefix=$ZLIB_ARM_DIR

# bild and install zlib
make && make install

# clean tmp
cd .. && rm -fr ./$ZLIB_VER

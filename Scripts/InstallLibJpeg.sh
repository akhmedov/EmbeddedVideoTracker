#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $JPEG_ARM_DIR
cd /tmp && tar -xzvf $ARCH_DIR/$LIBJPEG_VER.tar.gz

cd ./$LIBJPEG_VER
# export CC=arm-linux-gnueabihf-gcc
./configure --host=arm-linux CC=arm-linux-gnueabihf-gcc \
	--prefix=$JPEG_ARM_DIR

make && make install

# clean tmp
cd .. && rm -fr ./$LIBJPEG_VER

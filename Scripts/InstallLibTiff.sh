#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $TIFF_ARM_DIR
cd /tmp && tar -xzvf $ARCH_DIR/$LIBTIFF_VER.tar.gz

cd ./$LIBTIFF_VER
./configure --host=arm-linux CC=arm-linux-gnueabihf-gcc \
	CXX=arm-linux-gnueabihf-g++ --prefix=$TIFF_ARM_DIR

make && make install

# clean tmp
cd .. && rm -fr ./$LIBTIFF_VER

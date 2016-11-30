#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $WEBP_ARM_DIR
cd /tmp && tar -xzvf $ARCH_DIR/$WEBPLIB_VER.tar.gz

cd ./$WEBPLIB_VER
./configure --host=arm-linux CC=arm-linux-gnueabihf-gcc \
	CXX=arm-linux-gnueabihf-g++ --prefix=$WEBP_ARM_DIR

make && make install

# clean tmp
cd .. && rm -fr ./$WEBPLIB_VER

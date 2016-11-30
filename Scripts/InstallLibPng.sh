#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

# extract sources
mkdir -p $PNG_ARM_DIR # {bin,man/man1,include,lib}
cd /tmp && tar -xvf $ARCH_DIR/$LIBPNG_VER.tar.xz

cd ./$LIBPNG_VER
./configure --host=arm-linux \
	CC='arm-linux-gnueabihf-gcc -I/home/rolan/TrackCamera/LibARM/z/include -L/home/rolan/TrackCamera/LibARM/z/lib' \
	--prefix=$PNG_ARM_DIR

make && make install

# clean tmp
cd .. && rm -fr ./$LIBPNG_VER
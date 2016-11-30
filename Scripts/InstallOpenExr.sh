#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

mkdir -p $OPENEXR_ARM_DIR

cd /tmp && tar -xvf $ARCH_DIR/$OPENEXR_VER.tar.gz
cd $OPENEXR_VER

./configure --host=arm-linux \
	LDFLAGS="-L/home/rolan/TrackCamera/LibARM/z/lib" \
	CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ \
 	--prefix=$OPENEXR_ARM_DIR

make && make install

# clean tmp
cd .. && rm -fr ./$OPENEXR_VER

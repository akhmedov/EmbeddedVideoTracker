#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

mkdir -p $BASEEXR_ARM_DIR 
mkdir -p $OPENEXR_ARM_DIR

cd /tmp && tar -xvf $ARCH_DIR/$BASEEXR_VER.tar.gz
cd $BASEEXR_VER

#./configure --host=arm-linux \
#	LDFLAGS="-L/home/rolan/TrackCamera/LibARM/z/lib" \
#	CC=arm-linux-gnueabihf-gcc CXX=arm-linux-gnueabihf-g++ \
# 	--prefix=$BASEEXR_ARM_DIR

cmake -D CMAKE_C_COMPILER=$TOOLCH_DIR/bin/arm-linux-gnueabihf-gcc \
	-D CMAKE_CXX_COMPILER=$TOOLCH_DIR/bin/arm-linux-gnueabihf-g++ \
	-D CMAKE_AR=$TOOLCH_DIR/bin/arm-linux-gnueabihf-ar \
	-DZLIB_ROOT=$ZLIB_ARM_DIR \
	-DILMBASE_PACKAGE_PREFIX=$BASEEXR_ARM_DIR \
	-DCMAKE_INSTALL_PREFIX=$OPENEXR_ARM_DIR ./

make && make install

# clean tmp
cd .. && rm -fr ./$BASEEXR_VER

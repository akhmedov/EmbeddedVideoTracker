#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

mkdir -p {$OPENCV_ARM_DIR,$OPENCV_X86_DIR}

cd /tmp && unzip $ARCH_DIR/$OPENCV_VER.zip

# change toolchain version
cd ./$OPENCV_VER/platforms/linux
CMAKE_FILE=./arm-gnueabi.toolchain.cmake
cat $MEDIA_DIR/$CMAKE_FILE > $CMAKE_FILE

mkdir -p build_hardfp && cd build_hardfp

# add -DWITH_OPENEXR=OFF to off OpenEXR support
cmake -D CMAKE_TOOLCHAIN_FILE=../arm-gnueabi.toolchain.cmake \
	-D WITH_OPENEXR=OFF -D BUILD_SHARED_LIBS=OFF -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_C_COMPILER=$TOOLCH_DIR/bin/arm-linux-gnueabihf-gcc \
	-D CMAKE_CXX_COMPILER=$TOOLCH_DIR/bin/arm-linux-gnueabihf-g++ \
	-D CMAKE_AR=$TOOLCH_DIR/bin/arm-linux-gnueabihf-ar \
	-D CMAKE_INSTALL_PREFIX=$OPENCV_ARM_DIR ../../..

make -j4 && make install

cd /tmp && rm -fr /tmp/$OPENCV_VER
#!/bin/bash

# get global config
source Scripts/ExportGlobalVaribles.sh

mkdir -p $OPENCV_X86_DIR

cd /tmp && unzip $ARCH_DIR/$OPENCV_VER.zip

# change toolchain version
mkdir ./$OPENCV_VER/release
cd ./$OPENCV_VER/release

mkdir -p build_hardfp && cd build_hardfp

# add -DWITH_OPENEXR=OFF to off OpenEXR support
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=$OPENCV_X86_DIR \
	-D WITH_OPENEXR=OFF ../..

make -j4 && make install

cd /tmp && rm -fr /tmp/$OPENCV_VER
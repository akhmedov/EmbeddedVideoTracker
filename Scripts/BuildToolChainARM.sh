#!/bin/bash

# export global config 
source ExportGlobalVaribles.sh

# unpack GCC sources
cd /tmp && tar -xvzf /$PROJECT_DIR/$BACKUP_DIR/$GCC_ARCHIVE.tar.gz 

# go to toolchain directory
cd $PROJECT_DIR && mkdir -p $TOOLCH_ARM_DIR
cd $TOOLCH_ARM_DIR

# build Makefile
/tmp/$GCC_ARCHIVE/configure -march=armv7 --with-cpu=ARM \
	--exec-prefix=/$PROJECT_DIR/$TOOLCH_ARM_DIR \
	--enable-languages=c,c++ --enable-threads --disable-multilib \
	--disable-gtktest --disable-glibtest --disable-libarttest

# build gcc
make -j4 BOOT_CFLAGS='-O' bootstrap

# delete unpacked sources
rm -fr /tmp/$GCC_ARCHIVE

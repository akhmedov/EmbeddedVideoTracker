#!/bin/bash

# run this if neccesery
# sudo apt-get install build-essential git libmpc-dev

# export global config 
source ExportGlobalVaribles.sh

# unpack GCC sources
cd /tmp && tar -xvzf /$PROJECT_DIR/$BACKUP_DIR/$GCC_ARCHIVE.tar.gz 

# go to toolchain directory
cd $PROJECT_DIR && mkdir -p $TOOLCH_X86_DIR
cd $TOOLCH_X86_DIR

# build Makefile
/tmp/$GCC_ARCHIVE/configure \
	--exec-prefix=/$PROJECT_DIR/$TOOLCH_X86_DIR \
	--enable-languages=c,c++ --enable-threads --disable-multilib \
	--disable-gtktest --disable-glibtest --disable-libarttest

# build gcc
make -j4 BOOT_CFLAGS='-O' bootstrap

# delete unpacked sources
rm -fr /tmp/$GCC_ARCHIVE

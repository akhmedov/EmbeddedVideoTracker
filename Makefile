# compile options
ARM_GXX=arm-linux-gnueabihf-g++
GXX=g++
CXX_FLAGS=$(if ${DEBUG},-Wall ,) -O2
CXX_STD=-std=c++11
CXX_LIBS= -pthread -ldl

# opencv deps
Z_LIB_ARM=`pkg-config --libs --static ${ZLIB_ARM_DIR}/lib/pkgconfig/zlib.pc`
LIB_PNG_ARM=${PNG_ARM_DIR}/lib/libpng16.a
LIB_JPEG_ARM=${JPEG_ARM_DIR}/lib/libjpeg.a
LIB_TIFF_ARM=${TIFF_ARM_DIR}/lib/libtiff.a
LIB_WEBP_ARM=${WEBP_ARM_DIR}/lib/libwebp.a
# LIB_WEBP_ARM=`pkg-config --libs --static ${WEBP_ARM_DIR}/lib/pkgconfig/libwebp.pc`
LIB_JASP_ARM=`pkg-config --libs --static ${JPEG2000_ARM_DIR}/lib/pkgconfig/jasper.pc`

# opencv libs and flags
OPENCV_LIBS_ARM=`pkg-config --libs ${OPENCV_ARM_DIR}/lib/pkgconfig/opencv.pc`
OPENCV_FLAGS_ARM=`pkg-config --cflags ${OPENCV_ARM_DIR}/lib/pkgconfig/opencv.pc`
OPENCV_LIBS_X86=-L${OPENCV_X86_DIR}/lib -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs -lopencv_imgproc -lopencv_core
OPENCV_FLAGS_X86=`pkg-config --cflags ${OPENCV_X86_DIR}/lib/pkgconfig/opencv.pc`


hello: Source/Hello.cpp
	# source Scripts/ExportGlobalVaribles.sh
	$(ARM_GXX) $(CXX_STD) $(CXX_FLAGS) $(OPENCV_FLAGS_ARM) Source/Hello.cpp $(OPENCV_LIBS_ARM) $(Z_LIB_ARM) $(LIB_JPEG_ARM) $(CXX_LIBS) -o hello

server: Source/Server.cpp
	# source Scripts/ExportGlobalVaribles.sh
	$(ARM_GXX) $(CXX_STD) $(CXX_FLAGS) $(OPENCV_FLAGS_ARM) Source/Server.cpp $(OPENCV_LIBS_ARM) $(Z_LIB_ARM) $(LIB_TIFF_ARM) $(LIB_PNG_ARM) $(LIB_WEBP_ARM) $(LIB_JPEG_ARM) $(LIB_JASP_ARM) $(CXX_LIBS) -o server

client: Source/Client.cpp
	# source Scripts/ExportGlobalVaribles.sh
	$(GXX) $(CXX_STD) $(CXX_FLAGS) $(OPENCV_FLAGS_X86) Source/Client.cpp \
	$(OPENCV_LIBS_X86) -o client

clean:
	@rm -fr hello server client


MY_LOCAL_PATH := $(call my-dir)

#### libiconv
LOCAL_PATH:= $(call my-dir)/libiconv
LIBICONV_PATH:=$(LOCAL_PATH)
 
include $(CLEAR_VARS)
LOCAL_MODULE := iconv
LOCAL_CFLAGS := \
	-Wno-multichar \
	-D_ANDROID \
	-DLIBDIR=\"\" \
	-DBUILDING_LIBICONV \
	-DIN_LIBRARY
 
LOCAL_C_INCLUDES := \
	$(LIBICONV_PATH)/ \
	$(LIBICONV_PATH)/include \
	$(LIBICONV_PATH)/lib \
	$(LIBICONV_PATH)/libcharset/include \
	$(LIBICONV_PATH)/srclib
 
LOCAL_SRC_FILES := \
	libcharset/lib/localcharset.c \
	lib/iconv.c \
	lib/relocatable.c
include $(BUILD_SHARED_LIBRARY)


## libzbarjni
include $(CLEAR_VARS)

LOCAL_PATH := $(MY_LOCAL_PATH)
LOCAL_MODULE := ZBarDecoder
LOCAL_SRC_FILES := zbarjni.c \
		   zbar/img_scanner.c \
		   zbar/decoder.c \
		   zbar/image.c \
		   zbar/symbol.c \
		   zbar/convert.c \
 	       zbar/config.c \
		   zbar/scanner.c \
		   zbar/error.c \
		   zbar/refcnt.c \
		   zbar/video.c \
		   zbar/video/null.c \
		   zbar/decoder/code128.c \
		   zbar/decoder/code39.c \
		   zbar/decoder/code93.c \
		   zbar/decoder/codabar.c \
		   zbar/decoder/databar.c \
		   zbar/decoder/ean.c \
	  	   zbar/decoder/i25.c \
		   zbar/decoder/qr_finder.c \
		   zbar/qrcode/bch15_5.c \
		   zbar/qrcode/binarize.c \
		   zbar/qrcode/isaac.c \
		   zbar/qrcode/qrdec.c \
		   zbar/qrcode/qrdectxt.c \
		   zbar/qrcode/rs.c \
		   zbar/qrcode/util.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
		  			$(LOCAL_PATH)/zbar \
		    		$(LOCAL_PATH)/libiconv/include
		    
LOCAL_SHARED_LIBRARIES := libiconv

include $(BUILD_SHARED_LIBRARY)
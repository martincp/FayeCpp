LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	../../../libwebsockets/lib/base64-decode.c \
	../../../libwebsockets/lib/client-handshake.c \
	../../../libwebsockets/lib/client-parser.c \
	../../../libwebsockets/lib/client.c \
	../../../libwebsockets/lib/context.c \
	../../../libwebsockets/lib/extension-deflate-frame.c \
	../../../libwebsockets/lib/extension-deflate-stream.c \
	../../../libwebsockets/lib/getifaddrs.c \
	../../../libwebsockets/lib/handshake.c \
	../../../libwebsockets/lib/libwebsockets.c \
	../../../libwebsockets/lib/lws-plat-unix.c \
	../../../libwebsockets/lib/output.c \
	../../../libwebsockets/lib/parsers.c \
	../../../libwebsockets/lib/pollfd.c \
	../../../libwebsockets/lib/service.c \
	../../../libwebsockets/lib/sha-1.c \
	../../../jansson/src/dump.c \
	../../../jansson/src/error.c \
	../../../jansson/src/hashtable.c \
	../../../jansson/src/hashtable_seed.c \
	../../../jansson/src/load.c \
	../../../jansson/src/memory.c \
	../../../jansson/src/pack_unpack.c \
	../../../jansson/src/strbuffer.c \
	../../../jansson/src/strconv.c \
	../../../jansson/src/utf.c \
	../../../jansson/src/value.c \
	../../../private/jsonutils.cpp \
	../../../private/REBuffer.cpp \
	../../../private/REMutex.cpp \
	../../../private/REThread.cpp \
	../../../private/transport.cpp \
	../../../private/websocket.cpp \
	../../../client.cpp \
	../../../message.cpp \
	../../../variant.cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/../../../ \
	$(LOCAL_PATH)/../../../libwebsockets/lib/ \
	$(LOCAL_PATH)/../../../jansson/src/ \
	$(LOCAL_PATH)/../../../jansson/android/
		
LOCAL_CFLAGS := \
	-DHAVE_FAYECPP_CONFIG_H=1 \
	-DHAVE_CONFIG_H=1 \
	-DCMAKE_BUILD=1 \
	-DLWS_BUILTIN_GETIFADDRS=1 \
	-DHAVE_STDINT_H=1 \
	-DLOG_DEBUG=7 \
	-DLOG_ERR=3 \
	-DLOG_WARNING=4 \
	-DLOG_NOTICE=5 \
	-DLOG_INFO=6

LOCAL_MODULE := libfayecpp

LOCAL_LDLIBS := -llog -lz

#LOCAL_STATIC_LIBRARIES := libwebsockets
#LOCAL_SHARED_LIBRARIES := libjansson

include $(BUILD_SHARED_LIBRARY)

#$(call import-module,libwebsockets)
#$(call import-module,jansson)


LOCAL_PATH := $(call my-dir)

host_common_debug_CFLAGS :=

#For gl debbuging
#host_common_debug_CFLAGS += -DCHECK_GL_ERROR
#host_common_debug_CFLAGS += -DDEBUG_PRINTOUT


### host library #########################################
$(call emugl-begin-host-static-library,libGLESv1_dec)

$(call emugl-import, libOpenglCodecCommon libOpenglOsUtils)
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))

$(call emugl-gen-decoder,$(LOCAL_PATH),gl)

LOCAL_SRC_FILES := GLDecoder.cpp

$(call emugl-export,CFLAGS,$(host_common_debug_CFLAGS))

$(call emugl-end-module)


### host library, 64-bit ####################################
$(call emugl-begin-host-static-library,lib64GLESv1_dec)

$(call emugl-import, lib64OpenglCodecCommon lib64OpenglOsUtils)
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))

$(call emugl-gen-decoder,$(LOCAL_PATH),gl)

LOCAL_SRC_FILES := GLDecoder.cpp

$(call emugl-export,CFLAGS,$(host_common_debug_CFLAGS) -m64)

ifeq ($(HOST_OS),windows)
LOCAL_CC = /usr/bin/amd64-mingw32msvc-gcc 
LOCAL_CXX = /usr/bin/amd64-mingw32msvc-g++
HOST_AR = /usr/bin/x86_64-w64-mingw32-ar
endif

$(call emugl-end-module)

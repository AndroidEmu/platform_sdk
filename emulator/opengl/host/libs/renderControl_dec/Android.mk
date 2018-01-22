LOCAL_PATH := $(call my-dir)


### host library ############################################
$(call emugl-begin-host-static-library,lib_renderControl_dec)
$(call emugl-import,libOpenglCodecCommon)
$(call emugl-gen-decoder,$(LOCAL_PATH),renderControl)
# For renderControl_types.h
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-end-module)

### host library, 64-bit ####################################
$(call emugl-begin-host-static-library,lib64_renderControl_dec)
$(call emugl-import,lib64OpenglCodecCommon)
$(call emugl-gen-decoder,$(LOCAL_PATH),renderControl)
# For renderControl_types.h
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-export,CFLAGS,-m64)
ifeq ($(HOST_OS),windows)
LOCAL_CC = /usr/bin/amd64-mingw32msvc-gcc 
LOCAL_CXX = /usr/bin/amd64-mingw32msvc-g++
LOCAL_AR=/usr/bin/x86_64-w64-mingw32-ar
HOST_AR = /usr/bin/x86_64-w64-mingw32-ar
endif
$(call emugl-end-module)

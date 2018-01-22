LOCAL_PATH := $(call my-dir)

host_common_SRC_FILES := \
     GLESv2Imp.cpp       \
     GLESv2Context.cpp   \
     GLESv2Validate.cpp  \
     ShaderParser.cpp    \
     ProgramData.cpp


### GLES_V2 host implementation (On top of OpenGL) ########################
$(call emugl-begin-host-shared-library,libGLES_V2_translator)
$(call emugl-import, libGLcommon)

LOCAL_SRC_FILES := $(host_common_SRC_FILES)

$(call emugl-end-module)


### GLES_V2 host implementation, 64-bit ##############################
$(call emugl-begin-host-shared-library,lib64GLES_V2_translator)
$(call emugl-import, lib64GLcommon)

LOCAL_LDLIBS += -m64
LOCAL_SRC_FILES := $(host_common_SRC_FILES)

ifeq ($(HOST_OS),windows)
LOCAL_CC = /usr/bin/amd64-mingw32msvc-gcc 
LOCAL_CXX = /usr/bin/amd64-mingw32msvc-g++
LOCAL_LDLIBS += -L/usr/amd64-mingw32msvc/lib -lmsvcrt
LOCAL_NO_DEFAULT_LD_DIRS = 1
HOST_AR = /usr/bin/x86_64-w64-mingw32-ar
endif

$(call emugl-end-module)

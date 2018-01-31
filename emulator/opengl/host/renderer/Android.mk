LOCAL_PATH:=$(call my-dir)

# host renderer process ###########################
$(call emugl-begin-host-executable,emulator_renderer)
$(call emugl-import,libOpenglRender)
LOCAL_SRC_FILES := main.cpp
LOCAL_CFLAGS    += -O0 -g

#ifeq ($(HOST_OS),windows)
#LOCAL_LDLIBS += -lws2_32
#endif

$(call emugl-end-module)

# host renderer process ###########################
$(call emugl-begin-host-executable,emulator64_renderer)
$(call emugl-import,lib64OpenglRender)
LOCAL_SRC_FILES := main.cpp
LOCAL_CFLAGS    += -O0 -g
LOCAL_LDLIBS += -m64

ifeq ($(HOST_OS),windows)
LOCAL_CC = /usr/bin/amd64-mingw32msvc-gcc 
LOCAL_CXX = /usr/bin/amd64-mingw32msvc-g++
LOCAL_LDLIBS += -L/usr/amd64-mingw32msvc/lib -lmsvcrt
LOCAL_NO_DEFAULT_LD_DIRS = 1

HOST_AR = /usr/bin/x86_64-w64-mingw32-ar
endif

#ifeq ($(HOST_OS),windows)
#LOCAL_LDLIBS += -lws2_32
#endif

$(call emugl-end-module)

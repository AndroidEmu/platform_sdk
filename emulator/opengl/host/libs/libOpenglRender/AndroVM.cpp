#include "FrameBuffer.h"
#include "RenderServer.h"

extern "C" {
    int AndroVM_initLibrary();
    int AndroVM_FrameBuffer_initialize(int w, int h);
    int AndroVM_FrameBuffer_setupSubWindow(void *id, int w, int h, float zrot);
    int AndroVM_FrameBuffer_removeSubWindow();
    void *AndroVM_FrameBuffer_getSubWindow();
    int AndroVM_RenderServer_create(int p);
    int AndroVM_RenderServer_Main();
    int AndroVM_RenderServer_start();
    int AndroVM_setStreamMode(int);
    int AndroVM_setVMIP(char *);
    void AndroVM_setOpenGLDisplayRotation(float);
    bool AndroVM_initOpenGLRenderer(int, int, int, OnPostFn, void*);
    void AndroVM_setCallbackRotation(void (* fn)(float));
    void AndroVM_repaintOpenGLDisplay();
    void AndroVM_setDPI(int);
    void AndroVM_setViewport(int x0, int y0, int width, int height);
    float AndroVM_getDisplayRotation();
    bool AndroVM_registerOGLCallback(OnPostFn, void*);
}

int AndroVM_initLibrary()
{
    return initLibrary();
}

int AndroVM_FrameBuffer_initialize(int w, int h)
{
    return FrameBuffer::initialize(w, h, NULL, NULL);
}

int AndroVM_FrameBuffer_setupSubWindow(void *id, int w, int h, float zrot)
{
    return FrameBuffer::setupSubWindow((FBNativeWindowType)id, 0, 0, w, h, zrot);
}

int AndroVM_FrameBuffer_removeSubWindow() {
    return FrameBuffer::removeSubWindow();
}

void *AndroVM_FrameBuffer_getSubWindow() {
    FrameBuffer *fb = FrameBuffer::getFB();

    if (!fb)
        return NULL;

    return (void *)fb->getSubWindow();
}

static RenderServer *l_rserver = NULL;

int AndroVM_RenderServer_create(int p)
{
    l_rserver = RenderServer::create(p);
    return (l_rserver != NULL);
}

int AndroVM_RenderServer_Main()
{
    if (l_rserver)
        return l_rserver->Main();
    else
        return -1;
}

int AndroVM_RenderServer_start()
{
    if (l_rserver)
        return l_rserver->start();
    else
        return -1;
}

int AndroVM_setStreamMode(int m)
{
    return setStreamMode(m);
}

int AndroVM_setVMIP(char *ip)
{
    return setVMIP(ip);
}

void AndroVM_setOpenGLDisplayRotation(float zRot)
{
    setOpenGLDisplayRotation(zRot);
}

bool AndroVM_initOpenGLRenderer(int width, int height, int portNum, OnPostFn onPost, void* onPostContext)
{
    return initOpenGLRenderer(width, height, portNum, onPost, onPostContext);
}

bool AndroVM_registerOGLCallback(OnPostFn onPost, void* onPostContext)
{
    return FrameBuffer::registerOGLCallback(onPost, onPostContext);
}

void AndroVM_setCallbackRotation(void (* fn)(float)) {
    setCallbackRotation(fn);
}

void AndroVM_repaintOpenGLDisplay() {
    repaintOpenGLDisplay();
}

void AndroVM_setDPI(int d) {
    setDPI(d);
}

void AndroVM_setViewport(int x0, int y0, int width, int height)
{
    FrameBuffer::setViewport(x0, y0, width, height);
}
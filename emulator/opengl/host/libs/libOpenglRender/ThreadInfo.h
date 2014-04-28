/*
* Copyright (C) 2011 The Android Open Source Project
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
#ifndef _LIB_OPENGL_RENDER_THREAD_INFO_H
#define _LIB_OPENGL_RENDER_THREAD_INFO_H

#include "RenderContext.h"
#include "WindowSurface.h"
#include "GLDecoder.h"
#include "GL2Decoder.h"

#include <list>

struct RenderThreadInfo
{
    RenderThreadInfo();
    ~RenderThreadInfo();
    static RenderThreadInfo* get();

    RenderContextPtr currContext;
    WindowSurfacePtr currDrawSurf;
    WindowSurfacePtr currReadSurf;
    GLDecoder        m_glDec;
    GL2Decoder       m_gl2Dec;
    std::list<uint32_t> m_cctx;
    std::list<uint32_t> m_surf;
};

#endif

/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glTexCoord2fv (GLfloat* v)"

  Copyright  (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLTEXCOORD2FV_H_
#define INCLUDE_GEM_GLTEXCOORD2FV_H_

#include "Base/GemBase.h"
#include "Base/GemGLUtil.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglTexCoord2fv

    A Wrapper for the openGL-command "glTexCoord2fv (GLfloat* v)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglTexCoord2fv : public GemBase
{
    CPPEXTERN_HEADER (GEMglTexCoord2fv, GemBase)

    public:

        //////////
        // Constructor
        GEMglTexCoord2fv  (t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
	virtual~GEMglTexCoord2fv ();

        //////////
        // Do the rendering
        virtual void    render  (GemState *state);

       //////////
       // define and set the variables

	 GLfloat m_v[2];		// VAR
	virtual void	vMess 	 (t_float, t_float);		// FUN glTexCoord2fv GLfloat*


    private:

        //////////
        // Static member functions

	static void	vMessCallback	 (void*, t_floatarg, t_floatarg);		// CALLBACK glTexCoord2fv

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

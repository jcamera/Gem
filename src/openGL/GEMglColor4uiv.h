/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glColor4uiv(GLuint* v)"

  Copyright (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLCOLOR4UIV_H_
#define INCLUDE_GEM_GLCOLOR4UIV_H_

#include "Base/GemBase.h"
#include "Base/GemGLUtil.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglColor4uiv

    A Wrapper for the openGL-command "glColor4uiv(GLuint* v)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglColor4uiv : public GemBase
{
    CPPEXTERN_HEADER(GEMglColor4uiv, GemBase)

    public:

        //////////
        // Constructor
        GEMglColor4uiv (t_floatarg, t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
    virtual ~GEMglColor4uiv();

        //////////
        // Do the rendering
        virtual void    render (GemState *state);

       //////////
       // define and set the variables

	 GLuint m_v[4];		// VAR
	virtual void	vMess 	(t_float, t_float, t_float, t_float);		// FUN glColor4uiv GLuint*


    private:

        //////////
        // Static member functions

	static void	vMessCallback	(void*, t_floatarg, t_floatarg, t_floatarg, t_floatarg);		// CALLBACK glColor4uiv

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glRasterPos4iv (GLint* v)"

  Copyright  (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLRASTERPOS4IV_H_
#define INCLUDE_GEM_GLRASTERPOS4IV_H_

#include "Base/GemBase.h"
#include "Base/GemGLUtil.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglRasterPos4iv

    A Wrapper for the openGL-command "glRasterPos4iv (GLint* v)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglRasterPos4iv : public GemBase
{
    CPPEXTERN_HEADER (GEMglRasterPos4iv, GemBase)

    public:

        //////////
        // Constructor
        GEMglRasterPos4iv  (t_floatarg, t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
	virtual~GEMglRasterPos4iv ();

        //////////
        // Do the rendering
        virtual void    render  (GemState *state);

       //////////
       // define and set the variables

	 GLint m_v[4];		// VAR
	virtual void	vMess 	 (t_float, t_float, t_float, t_float);		// FUN glRasterPos4iv GLint*


    private:

        //////////
        // Static member functions

	static void	vMessCallback	 (void*, t_floatarg, t_floatarg, t_floatarg, t_floatarg);		// CALLBACK glRasterPos4iv

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

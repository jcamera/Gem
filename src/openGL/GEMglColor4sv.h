/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glColor4sv (GLshort* v)"

  Copyright  (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLCOLOR4SV_H_
#define INCLUDE_GEM_GLCOLOR4SV_H_

#include "Base/GemBase.h"
#include "Base/GemGLUtil.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglColor4sv

    A Wrapper for the openGL-command "glColor4sv (GLshort* v)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglColor4sv : public GemBase
{
    CPPEXTERN_HEADER (GEMglColor4sv, GemBase)

    public:

        //////////
        // Constructor
        GEMglColor4sv  (t_floatarg, t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
	virtual~GEMglColor4sv ();

        //////////
        // Do the rendering
        virtual void    render  (GemState *state);

       //////////
       // define and set the variables

	 GLshort m_v[4];		// VAR
	virtual void	vMess 	 (t_float, t_float, t_float, t_float);		// FUN glColor4sv GLshort*


    private:

        //////////
        // Static member functions

	static void	vMessCallback	 (void*, t_floatarg, t_floatarg, t_floatarg, t_floatarg);		// CALLBACK glColor4sv

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

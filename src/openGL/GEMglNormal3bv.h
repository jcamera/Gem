/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glNormal3bv (GLbyte* v)"

  Copyright  (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLNORMAL3BV_H_
#define INCLUDE_GEM_GLNORMAL3BV_H_

#include "Base/GemBase.h"
#include "Base/GemGLUtil.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglNormal3bv

    A Wrapper for the openGL-command "glNormal3bv (GLbyte* v)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglNormal3bv : public GemBase
{
    CPPEXTERN_HEADER (GEMglNormal3bv, GemBase)

    public:

        //////////
        // Constructor
        GEMglNormal3bv  (t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
	virtual~GEMglNormal3bv();

        //////////
        // Do the rendering
        virtual void    render  (GemState *state);

       //////////
       // define and set the variables

	 GLbyte m_v[3];		// VAR
	virtual void	vMess 	 (t_float, t_float, t_float);		// FUN glNormal3bv GLbyte*


    private:

        //////////
        // Static member functions

	static void	vMessCallback	(void*, t_floatarg, t_floatarg, t_floatarg);		// CALLBACK glColor3bv

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

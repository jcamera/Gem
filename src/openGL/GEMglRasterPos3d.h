/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glRasterPos3d(GLdouble x, GLdouble y, GLdouble z)"

  Copyright (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLRASTERPOS3D_H_
#define INCLUDE_GEM_GLRASTERPOS3D_H_

#include "Base/GemGLUtil.h"
#include "Base/GemBase.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglRasterPos3d

    A Wrapper for the openGL-command "glRasterPos3d(GLdouble x, GLdouble y, GLdouble z)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglRasterPos3d : public GemBase
{
    CPPEXTERN_HEADER(GEMglRasterPos3d, GemBase)

    public:

        //////////
        // Constructor
        GEMglRasterPos3d (t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
        virtual ~GEMglRasterPos3d();

        //////////
        // Do the rendering
        virtual void    render (GemState *state);

       //////////
       // define and set the variables

	 GLdouble x;		// VAR
	virtual void	xMess 	(double);		// FUN glRasterPos3d GLdouble

	GLdouble y;		// VAR
	virtual void	yMess 	(double);		// FUN glRasterPos3d GLdouble

	GLdouble z;		// VAR
	virtual void	zMess 	(double);		// FUN glRasterPos3d GLdouble


    private:

        //////////
        // Static member functions

	static void	xMessCallback	(void*, t_floatarg);		// CALLBACK glRasterPos3d
	static void	yMessCallback	(void*, t_floatarg);		// CALLBACK glRasterPos3d
	static void	zMessCallback	(void*, t_floatarg);		// CALLBACK glRasterPos3d

	// we need some inlets
	t_inlet	*m_inlet[ 3 ];
};

#endif  // for header file

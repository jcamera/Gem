/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glMatrixMode(GLenum mode)"

  Copyright (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLMATRIXMODE_H_
#define INCLUDE_GEM_GLMATRIXMODE_H_

#include "Base/GemGLUtil.h"
#include "Base/GemBase.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglMatrixMode

    A Wrapper for the openGL-command "glMatrixMode(GLenum mode)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglMatrixMode : public GemBase
{
    CPPEXTERN_HEADER(GEMglMatrixMode, GemBase)

    public:

        //////////
        // Constructor
        GEMglMatrixMode (t_symbol*);         // CON

    protected:

        //////////
        // Destructor
        virtual ~GEMglMatrixMode();

        //////////
        // Do the rendering
        virtual void    render (GemState *state);

       //////////
       // define and set the variables

	 GLenum mode;		// VAR
	virtual void	modeMess 	(int);		// FUN glMatrixMode GLenum


    private:

        //////////
        // Static member functions

	static void	modeMessCallback	(void*, t_symbol*);		// CALLBACK glMatrixMode

	// we need some inlets
	t_inlet	*m_inlet[ 1 ];
};

#endif  // for header file

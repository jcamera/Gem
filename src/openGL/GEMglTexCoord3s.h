/*-----------------------------------------------------------------
LOG
GEM - Graphics Environment for Multimedia

A wrapper for "glTexCoord3s(GLshort s, GLshort t, GLshort r)"

  Copyright (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM. zmoelnig@iem.kug.ac.at
  this file has been generated automatically...

  For information on usage and redistribution, and for a DISCLAIMER OF ALL
  WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.

 -----------------------------------------------------------------*/

#ifndef INCLUDE_GEM_GLTEXCOORD3S_H_
#define INCLUDE_GEM_GLTEXCOORD3S_H_

#include "Base/GemGLUtil.h"
#include "Base/GemBase.h"

/*-----------------------------------------------------------------
-------------------------------------------------------------------
CLASS
    GEMglTexCoord3s

    A Wrapper for the openGL-command "glTexCoord3s(GLshort s, GLshort t, GLshort r)"

KEYWORDS
    openGL

OPENGL_VERSION 0

------------------------------------------------------------------*/

class GEM_EXTERN GEMglTexCoord3s : public GemBase
{
    CPPEXTERN_HEADER(GEMglTexCoord3s, GemBase)

    public:

        //////////
        // Constructor
        GEMglTexCoord3s (t_floatarg, t_floatarg, t_floatarg);         // CON

    protected:

        //////////
        // Destructor
        virtual ~GEMglTexCoord3s();

        //////////
        // Do the rendering
        virtual void    render (GemState *state);

       //////////
       // define and set the variables

	 GLshort s;		// VAR
	virtual void	sMess 	(int);		// FUN glTexCoord3s GLshort

	GLshort t;		// VAR
	virtual void	tMess 	(int);		// FUN glTexCoord3s GLshort

	GLshort r;		// VAR
	virtual void	rMess 	(int);		// FUN glTexCoord3s GLshort


    private:

        //////////
        // Static member functions

	static void	sMessCallback	(void*, t_floatarg);		// CALLBACK glTexCoord3s
	static void	tMessCallback	(void*, t_floatarg);		// CALLBACK glTexCoord3s
	static void	rMessCallback	(void*, t_floatarg);		// CALLBACK glTexCoord3s

	// we need some inlets
	t_inlet	*m_inlet[ 3 ];
};

#endif  // for header file

////////////////////////////////////////////////////////
//
// GEM - Graphics Environment for Multimedia
//
// zmoelnig@iem.kug.ac.at
//
// Implementation file
//
//    Copyright (c) 2002 IOhannes m zmoelnig. forum::f�r::uml�ute. IEM
//    this file has been generated automatically
//
//    For information on usage and redistribution, and for a DISCLAIMER OF ALL
//    WARRANTIES, see the file, "GEM.LICENSE.TERMS" in this distribution.
//
/////////////////////////////////////////////////////////

#include "GEMglPushMatrix.h"

CPPEXTERN_NEW (GEMglPushMatrix )

/////////////////////////////////////////////////////////
//
// GEMglPushMatrix
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglPushMatrix :: GEMglPushMatrix()
{
	m_inlet[0] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym(""));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglPushMatrix :: ~GEMglPushMatrix(){
inlet_free(m_inlet[0]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglPushMatrix :: render(GemState *state)
{ glPushMatrix(); }


/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglPushMatrix :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglPushMatrix,gensym("glPushMatrix"),A_NULL);
}



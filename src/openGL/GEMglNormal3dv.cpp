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

#include "GEMglNormal3dv.h"

CPPEXTERN_NEW_WITH_THREE_ARGS (GEMglNormal3dv, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT)

/////////////////////////////////////////////////////////
//
// GEMglNormal3dv
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglNormal3dv :: GEMglNormal3dv(t_floatarg arg1=0, t_floatarg arg2=0, t_floatarg arg3=0)
{
	vMess(arg1, arg2, arg3);
	m_inlet[0] = inlet_new (this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("v"));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglNormal3dv :: ~GEMglNormal3dv(){
inlet_free(m_inlet[0]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglNormal3dv :: render(GemState *state)
{ glNormal3dv (m_v); }


/////////////////////////////////////////////////////////
// set my variables
/////////////////////////////////////////////////////////

void GEMglNormal3dv :: vMess (t_float arg1, t_float arg2, t_float arg3) {
	m_v[0]=(GLdouble)arg1;
	m_v[1]=(GLdouble)arg2;
	m_v[2]=(GLdouble)arg3;
	setModified();
}



/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglNormal3dv :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglNormal3dv,gensym("glNormal3dv"),A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);

	class_addmethod(classPtr, (t_method)&GEMglNormal3dv::vMessCallback, gensym("v"), A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);
}


void GEMglNormal3dv :: vMessCallback (void* data, t_floatarg f1, t_floatarg f2, t_floatarg f3) {
	GetMyClass(data)->vMess (f1, f2, f3);
}

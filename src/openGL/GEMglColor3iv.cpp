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

#include "GEMglColor3iv.h"

CPPEXTERN_NEW_WITH_THREE_ARGS (GEMglColor3iv, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT)

/////////////////////////////////////////////////////////
//
// GEMglColor3iv
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglColor3iv :: GEMglColor3iv(t_floatarg arg1=0, t_floatarg arg2=0, t_floatarg arg3=0)
{
	vMess(arg1, arg2, arg3);
	m_inlet[0] = inlet_new (this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("v"));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglColor3iv :: ~GEMglColor3iv(){
inlet_free(m_inlet[0]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglColor3iv :: render(GemState *state)
{ glColor3iv (m_v); }


/////////////////////////////////////////////////////////
// set my variables
/////////////////////////////////////////////////////////

void GEMglColor3iv :: vMess (t_float arg1, t_float arg2, t_float arg3) {
	m_v[0]=(GLint)arg1;
	m_v[1]=(GLint)arg2;
	m_v[2]=(GLint)arg3;
	setModified();
}



/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglColor3iv :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglColor3iv,gensym("glColor3iv"),A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);

	class_addmethod(classPtr, (t_method)&GEMglColor3iv::vMessCallback, gensym("v"), A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);
}


void GEMglColor3iv :: vMessCallback (void* data, t_floatarg f1, t_floatarg f2, t_floatarg f3) {
	GetMyClass(data)->vMess (f1, f2, f3);
}

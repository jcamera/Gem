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

#include "GEMglNormal3s.h"

CPPEXTERN_NEW_WITH_THREE_ARGS (GEMglNormal3s , t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT)

/////////////////////////////////////////////////////////
//
// GEMglNormal3s
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglNormal3s :: GEMglNormal3s(t_floatarg arg1=0, t_floatarg arg2=0, t_floatarg arg3=0) :
             		nx((GLshort)arg1),
		ny((GLshort)arg2),
		nz((GLshort)arg3)
{
	m_inlet[0] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("nx"));
	m_inlet[1] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("ny"));
	m_inlet[2] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("nz"));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglNormal3s :: ~GEMglNormal3s(){
inlet_free(m_inlet[0]);
inlet_free(m_inlet[1]);
inlet_free(m_inlet[2]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglNormal3s :: render(GemState *state)
{ glNormal3s(nx, ny, nz); }


/////////////////////////////////////////////////////////
// set my variables
/////////////////////////////////////////////////////////

void GEMglNormal3s :: nxMess (int arg1) {
	nx = (GLshort)arg1;
	setModified();
}


void GEMglNormal3s :: nyMess (int arg1) {
	ny = (GLshort)arg1;
	setModified();
}


void GEMglNormal3s :: nzMess (int arg1) {
	nz = (GLshort)arg1;
	setModified();
}



/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglNormal3s :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglNormal3s,gensym("glNormal3s"),A_NULL);

	class_addmethod(classPtr, (t_method)&GEMglNormal3s::nxMessCallback, gensym("nx"), A_NULL);
	class_addmethod(classPtr, (t_method)&GEMglNormal3s::nyMessCallback, gensym("ny"), A_NULL);
	class_addmethod(classPtr, (t_method)&GEMglNormal3s::nzMessCallback, gensym("nz"), A_NULL);
}


void GEMglNormal3s :: nxMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->nxMess ( (t_int)    arg0);
}
void GEMglNormal3s :: nyMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->nyMess ( (t_int)    arg0);
}
void GEMglNormal3s :: nzMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->nzMess ( (t_int)    arg0);
}

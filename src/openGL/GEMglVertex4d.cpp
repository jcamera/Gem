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

#include "GEMglVertex4d.h"

CPPEXTERN_NEW_WITH_FOUR_ARGS (GEMglVertex4d , t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT)

/////////////////////////////////////////////////////////
//
// GEMglVertex4d
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglVertex4d :: GEMglVertex4d(t_floatarg arg1=0, t_floatarg arg2=0, t_floatarg arg3=0, t_floatarg arg4=0) :
             		x((GLdouble)arg1),
		y((GLdouble)arg2),
		z((GLdouble)arg3),
		w((GLdouble)arg4)
{
	m_inlet[0] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("x"));
	m_inlet[1] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("y"));
	m_inlet[2] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("z"));
	m_inlet[3] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("w"));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglVertex4d :: ~GEMglVertex4d(){
inlet_free(m_inlet[0]);
inlet_free(m_inlet[1]);
inlet_free(m_inlet[2]);
inlet_free(m_inlet[3]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglVertex4d :: render(GemState *state)
{ glVertex4d(x, y, z, w); }


/////////////////////////////////////////////////////////
// set my variables
/////////////////////////////////////////////////////////

void GEMglVertex4d :: xMess (double arg1) {
	x = (GLdouble)arg1;
	setModified();
}


void GEMglVertex4d :: yMess (double arg1) {
	y = (GLdouble)arg1;
	setModified();
}


void GEMglVertex4d :: zMess (double arg1) {
	z = (GLdouble)arg1;
	setModified();
}


void GEMglVertex4d :: wMess (double arg1) {
	w = (GLdouble)arg1;
	setModified();
}



/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglVertex4d :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglVertex4d,gensym("glVertex4d"),A_NULL);

	class_addmethod(classPtr, (t_method)&GEMglVertex4d::xMessCallback, gensym("x"), A_NULL);
	class_addmethod(classPtr, (t_method)&GEMglVertex4d::yMessCallback, gensym("y"), A_NULL);
	class_addmethod(classPtr, (t_method)&GEMglVertex4d::zMessCallback, gensym("z"), A_NULL);
	class_addmethod(classPtr, (t_method)&GEMglVertex4d::wMessCallback, gensym("w"), A_NULL);
}


void GEMglVertex4d :: xMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->xMess ( (t_int)    arg0);
}
void GEMglVertex4d :: yMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->yMess ( (t_int)    arg0);
}
void GEMglVertex4d :: zMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->zMess ( (t_int)    arg0);
}
void GEMglVertex4d :: wMessCallback (   void* data, t_floatarg    arg0) {
	GetMyClass(data)->wMess ( (t_int)    arg0);
}

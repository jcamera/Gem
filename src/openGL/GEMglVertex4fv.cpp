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

#include "GEMglVertex4fv.h"

CPPEXTERN_NEW_WITH_FOUR_ARGS (GEMglVertex4fv , t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT, t_floatarg, A_DEFFLOAT)


/////////////////////////////////////////////////////////
//
// GEMglVertex4fv
//
/////////////////////////////////////////////////////////
// Constructor
//
/////////////////////////////////////////////////////////
GEMglVertex4fv :: GEMglVertex4fv(t_floatarg arg1=0, t_floatarg arg2=0,
				 t_floatarg arg3=0, t_floatarg arg4=0)
{
  vMess(arg1, arg2, arg3, arg4);
  m_inlet[0] = inlet_new(this->x_obj, &this->x_obj->ob_pd, &s_float, gensym("v"));
}

/////////////////////////////////////////////////////////
// Destructor
//
/////////////////////////////////////////////////////////
GEMglVertex4fv :: ~GEMglVertex4fv(){
inlet_free(m_inlet[0]);
}
/////////////////////////////////////////////////////////
// Render
//
/////////////////////////////////////////////////////////
void GEMglVertex4fv :: render(GemState *state)
{ glVertex4fv(m_v); }


/////////////////////////////////////////////////////////
// set my variables
/////////////////////////////////////////////////////////

void GEMglVertex4fv :: vMess (t_float arg1, t_float arg2, t_float arg3, t_float arg4) {
  m_v[0]=(GLfloat)arg1;
  m_v[1]=(GLfloat)arg2;
  m_v[2]=(GLfloat)arg3;
  m_v[3]=(GLfloat)arg4;
  setModified();
}



/////////////////////////////////////////////////////////
// static member function
//
/////////////////////////////////////////////////////////

void GEMglVertex4fv :: obj_setupCallback(t_class *classPtr) {
        class_addcreator((t_newmethod)_classGEMglVertex4fv,gensym("glVertex4fv"), A_FLOAT, A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);

	class_addmethod(classPtr, (t_method)&GEMglVertex4fv::vMessCallback, gensym("v"), A_FLOAT, A_FLOAT, A_FLOAT, A_FLOAT, A_NULL);
}


void GEMglVertex4fv :: vMessCallback (void* data, t_floatarg f1, t_floatarg f2,
				     t_floatarg f3, t_floatarg f4) {
  GetMyClass(data)->vMess(f1, f2, f3, f4);
}

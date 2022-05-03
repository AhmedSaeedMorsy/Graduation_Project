
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/modules/doctor_modules/patients/patients.dart';
import 'package:h_care/modules/doctor_modules/schaduale/schaduale.dart';

import 'package:h_care/modules/settings/settings.dart';

import 'package:h_care/shared/cubit/doctor_cubit/states.dart';

class DoctorCubit extends Cubit<DoctorStates>{
  DoctorCubit():super( DoctorInitState());

  static DoctorCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomnavItem = const [
    Schaduale(),
    Patients(),    
    Settings(),
  ];
  
  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }


}
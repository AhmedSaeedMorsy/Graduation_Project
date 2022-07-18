
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/states.dart';
import 'package:h_care/presentation/modules/doctor_modules/patients/patients.dart';
import 'package:h_care/presentation/modules/doctor_modules/schaduale/schaduale.dart';
import 'package:h_care/presentation/modules/settings/settings.dart';


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
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:h_care/modules/settings/settings.dart';
import 'package:h_care/modules/user_modules/home/home.dart';
import 'package:h_care/modules/user_modules/medical_history/medical_history.dart';
import 'package:h_care/modules/user_modules/pharmacy/pharmacy.dart';
import 'package:h_care/modules/user_modules/specialties/specialties.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';


class UserCubit extends Cubit<UserStates>{
  UserCubit():super( UserInitState());

  static UserCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomnavItem = const [
    Home(),
    Specialties(),
    Pharmacy(),
    MedicalHistory(),
    
    Settings(),
  ];
  
  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }


}
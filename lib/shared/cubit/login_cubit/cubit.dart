import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/shared/cubit/login_cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitState());

  static LoginCubit get(context)=> BlocProvider.of(context);

  bool isShown = true;  

  Icon suffix = const Icon(Icons.visibility_off_outlined);
  void changeVisibilityPassword(){
    isShown = !isShown;
    suffix = isShown ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined);
    emit(ChangeVisibilityPasswordState());
  }

}
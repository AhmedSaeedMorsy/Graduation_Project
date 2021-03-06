// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/login_cubit/states.dart';
import 'package:h_care/constant/end-points.dart';
import 'package:h_care/data/model/user-rigester-model.dart';
import 'package:h_care/data/remote/dio.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isShownConfirmPassword = true;
  bool isShownPassword = true;
  Icon suffixConfirmPassword = const Icon(Icons.visibility_off_outlined);
  Icon suffixPassword = const Icon(Icons.visibility_off_outlined);

  void changeVisibilityPassword() {
    isShownPassword = !isShownPassword;

    suffixPassword = isShownPassword
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);

    emit(ChangeVisibilityPasswordState());
  }

  void changeVisibilityConfirmPassword() {
    isShownConfirmPassword = !isShownConfirmPassword;

    suffixConfirmPassword = isShownConfirmPassword
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);
    emit(ChangeVisibilityPasswordState());
  }

  UserRigesterModel? userRigesterModel;

  void userRigester({
    required String confirmPassward,
    required String email,
    required String passward,
    required String firstName,
    required String lastName,
    required String phoneNumper,
    required var age,
  }) {
    emit(UserRigesterLoadingState());
    DioHelper.postData(path: rigester, data: {
      "confirmpassward": confirmPassward,
      "email": email,
      "passward": passward,
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
      "phoneNumper": phoneNumper,
    }).then((value) {
      userRigesterModel = UserRigesterModel.fromJson(value.data);

      emit(UserRigesterSuccessState());
      
    }).catchError((error) {
      print(error.toString());
      emit(UserRigesterErrorState(error.toString()));
    });
  }

  UserRigesterModel? userLoginModel;

  void userLogin({
    required String email,
    required String passward,
  }) {
    emit(UserLoginLoadingState());
    DioHelper.postData(path: login, data: {
      "email": email,
      "passward": passward,
    }).then((value) {
      userLoginModel = UserRigesterModel.fromJson(value.data);
      emit(UserLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserLoginErrorState(error.toString()));
    });
  }
}

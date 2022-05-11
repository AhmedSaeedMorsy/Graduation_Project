import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:h_care/shared/constant.dart';
import 'package:h_care/shared/cubit/login_cubit/states.dart';
import 'package:h_care/shared/network/remote/dio.dart';

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
}

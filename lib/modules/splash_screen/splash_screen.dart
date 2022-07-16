// ignore_for_file: file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:h_care/layout/doctor_layout.dart';
import 'package:h_care/modules/login/login_screen.dart';

import 'package:h_care/modules/onBoardin_screen/on_boarding_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/constant.dart';

import 'package:h_care/shared/style/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../layout/user_layout.dart';
import '../../shared/cubit/login_cubit/cubit.dart';
import '../../shared/network/local/cache_helper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////////////////////////// Cahsing data with shared preferences/////////////////////////
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    role = CacheHelper.getData(key: 'role');
    late Widget widget;
    token = CacheHelper.getData(key: 'token');
    ////////////////////// Check on start widget////////////////
    if (onBoarding != null) {
      if (token != null) {
        if (role == "User") {
          widget = UserHomeLayOut();
        } else if (role == "Doctor") {
          widget = DoctorHomeLayOut();
        }
      } else {
        widget = LoginScreen();
      }
    } else {
      widget = const OnBoardingScren();
    }
    //////////////////// UI design for splash screen /////////////////////////
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: const Image(
          image: AssetImage("assets/images/icon.png"),
        ),
        animationDuration: const Duration(seconds: 2),
        splashIconSize: 200.0,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen: widget,
        backgroundColor: forthColor,
      ),
    );
  }
}
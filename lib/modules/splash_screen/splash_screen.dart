// ignore_for_file: file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:h_care/modules/onBoardin_screen/on_boarding_screen.dart';

import 'package:h_care/shared/style/color.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: const Image(
          image: AssetImage("assets/images/icon.png"),
        ),
        splashIconSize: 200.0,
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen:const OnBoardingScren(),
        backgroundColor: forthColor,
      ),
    );
  }
}

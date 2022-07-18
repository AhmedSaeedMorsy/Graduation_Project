import 'package:flutter/material.dart';
import 'package:h_care/constant/style/color.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Hcare",
  scaffoldBackgroundColor: forthColor,
  primarySwatch: Colors.blueGrey,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: mainColor,
  ),
  appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: forthColor,
      iconTheme: IconThemeData(
        color: mainColor,
      )),
);

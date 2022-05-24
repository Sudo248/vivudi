import 'package:flutter/material.dart';
import 'package:vivudi/resources/app_color.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  focusColor: AppColors.primaryColor,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 48),
    headline2: TextStyle(fontSize: 36),
    headline3: TextStyle(fontSize: 24),
    button: TextStyle(fontSize: 21),
    bodyText1: TextStyle(fontSize: 24),
    bodyText2: TextStyle(fontSize: 21),
    subtitle1: TextStyle(fontSize: 13),
    subtitle2: TextStyle(fontSize: 11),
  )
);
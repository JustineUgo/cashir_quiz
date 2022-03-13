import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  static const blue= Color(0xff145EE5);
  static final white = Colors.white;
  static final dark = Color(0xff211B1B).withOpacity(.2);
  static const darkColor = Color(0xff2B2D42);
  static const textDarkColor = Color(0xff2B2D42);
  static const textLightColor = Color(0xffFFFFFF);
  static const greyColor = Color(0xff8D99AE);
  static final black = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    primaryColor: AppTheme.darkColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blue,
      // foregroundColor: darkPurple,
      // splashColor: darkPurple
    ), 
  );


  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1Light,
    headline2: _headline2Light,
    headline3: _headline3Light,
    headline4: _headline4Light,
  );


  static final TextStyle _headline1Light = TextStyle(
    color: AppTheme.textDarkColor,
    fontWeight: FontWeight.w800,
    fontSize: 25
  );

  static final TextStyle _headline2Light = TextStyle(
    color: AppTheme.textDarkColor,
    fontWeight: FontWeight.w500,
    fontSize: 20
  );

  static final TextStyle _headline3Light = TextStyle(
    color: AppTheme.textDarkColor,
    fontSize: 18
  );

  static final TextStyle _headline4Light = TextStyle(
    color: AppTheme.textDarkColor,
    fontSize: 14
  );

}
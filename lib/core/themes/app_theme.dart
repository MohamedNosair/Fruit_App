import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'cairo',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.light,
    ).copyWith(surface: Colors.white, primary: Colors.white),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  ); 
}

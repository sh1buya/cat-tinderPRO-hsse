import 'package:flutter/material.dart';

class AppColors {
  static const lightGrey = Color(0xFFECECEC);
  static const like = Colors.green;
  static const dislike = Colors.red;
}

class AppText {
  static const title = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
}

ThemeData appTheme() => ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightGrey,
    foregroundColor: Colors.black87,
    elevation: 0,
  ),
);

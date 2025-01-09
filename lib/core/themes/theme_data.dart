import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';

class AppThemeData {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold)),
  );
}

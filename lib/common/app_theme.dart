import 'package:flutter/material.dart';
import 'package:todo_c12/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: Colors.white,
      backgroundColor: Colors.white,
    ),
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
            //  color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w700),
        titleLarge:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.bgColorLight,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape:
            const CircleBorder(side: BorderSide(color: Colors.white, width: 4)),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
      unselectedItemColor: Colors.grey[350],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}

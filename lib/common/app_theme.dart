import 'package:flutter/material.dart';
import 'package:todo_c12/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0),
    textTheme: const TextTheme(
        titleLarge:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
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

import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch)),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        iconTheme: IconThemeData(size: 22, color: AppColors.primaryColor)),
    textTheme: TextTheme(
        titleLarge: const TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        bodySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey.shade700)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(13),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(12)),
    ),
    // primarySwatch:
    //     MaterialColor(AppColors.primaryColor.value, AppColors.colorSwatch),
  );
}

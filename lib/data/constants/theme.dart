import 'package:bloggy/data/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(fontSize: 20, color: AppColors.textPrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textPrimary),
        ),
      ),
      scaffoldBackgroundColor: AppColors.backgroundPrimary,
      textTheme: const TextTheme().apply(bodyColor: AppColors.textPrimary));
}

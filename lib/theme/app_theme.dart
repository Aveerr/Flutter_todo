import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundBottom,
  primaryColor: AppColors.secondary,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 80),
      backgroundColor: AppColors.third,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      side: BorderSide(color: AppColors.secondary, width: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 4,
    ),
  ),
);

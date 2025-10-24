import 'package:flutter/material.dart';
import 'app_colors.dart';

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
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
  );
}
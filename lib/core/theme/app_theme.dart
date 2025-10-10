import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class AppTheme {
  const AppTheme._internal();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBgLight,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.contentFgLight),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBgDark,
    colorScheme: const ColorScheme.dark().copyWith(primary: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.contentFgDark),
  );
}

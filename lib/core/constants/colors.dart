import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/theme/app_theme.dart';

class AppColors {
  const AppColors._();

  static bool get isDarkMode => AppTheme.currentMode == ThemeMode.dark;

  static const primary = Color(0xFF15ABFF);

  static const scaffoldBgLight = Color(0xFFF8F9FE);
  static const scaffoldBgDark = Color(0xFF212434);
  static Color get scaffoldBg => isDarkMode ? scaffoldBgDark : scaffoldBgLight;

  static const contentBgLight = Colors.white;
  static const contentBgDark = Color(0xFF1D1F2B);
  static Color get contentBg => isDarkMode ? contentBgDark : contentBgLight;

  static Color get blackOrWhite => isDarkMode ? Colors.white : Colors.black;
  static Color get blackOrWhiteReverse => isDarkMode ? Colors.black : Colors.white;

  static const contentFgLight = Color(0xFF000000);
  static const contentFgDark = Color(0xFFC3D3D9);
  static Color get contentFg => isDarkMode ? contentFgDark : contentFgLight;

  static const black171725 = Color(0xFF171725);
  static const black = Color(0xFF000000);
  static const black4A4A4A = Color(0xFF4A4A4A);

  static const greyC3D3D9 = Color(0xFFC3D3D9);

  static const secondary = Color(0xFF005AA9);
  static const blue005AA9 = Color(0xFF005AA9);
  static const blue005BAA = Color(0xFF005BAA);
  static const blueD7F1FF = Color(0xFFD7F1FF);
  static const blue15ABFF = Color(0xFF15ABFF);

  static const greyE2E8F0 = Color(0xFFE2E8F0);
  static const grey92929D = Color(0xFF92929D);
  static const grey0F172A = Color(0xFF0F172A);
  static const grey6F767E = Color(0xFF6F767E);
  static const greyF2F4FA = Color(0xFFF2F4FA);
  static const grey64748B = Color(0xFF64748B);
  static const grey94A3B8 = Color(0xFF94A3B8);
  static const grey93989A = Color(0xFF93989A);
  static const green21CCC3 = Color(0xFF21CCC3);
}

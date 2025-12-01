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
  static Color get blackOrWhiteReverse =>
      isDarkMode ? Colors.black : Colors.white;

  static const contentFgLight = Color(0xFF000000);
  static const contentFgDark = Color(0xFFC3D3D9);
  static Color get contentFg => isDarkMode ? contentFgDark : contentFgLight;

  static const black171725 = Color(0xFF171725);
  static const black = Color(0xFF000000);
  static const black4A4A4A = Color(0xFF4A4A4A);
  static const black0D0D0D = Color(0xFF0D0D0D);

  static const greyC3D3D9 = Color(0xFFC3D3D9);

  static const greyF1F5F9 = Color(0xFFF1F5F9);
  static const grey334155 = Color(0xFF334155);

  static const secondary = Color(0xFF005AA9);
  static const blue005AA9 = Color(0xFF005AA9);
  static const blue005BAA = Color(0xFF005BAA);
  static const blue085DA8 = Color(0xFF085DA8);
  static const blueD7F1FF = Color(0xFFD7F1FF);
  static const blue15ABFF = Color(0xFF15ABFF);
  static const blue3182CE = Color(0xFF3182CE);
  static const blueE7F3FF = Color(0xFFE7F3FF);
  static const blueD7E5F1 = Color(0xFFD7E5F1);

  static const greyE2E8F0 = Color(0xFFE2E8F0);
  static const greyEFEFEF = Color(0xFFEFEFEF);
  static const greyE9E9E9 = Color(0xFFE9E9E9);
  static const greyE3F0FF = Color(0xFFE3F0FF);
  static const greyFBFBFB = Color(0xFFFBFBFB);
  static const grey92929D = Color(0xFF92929D);
  static const grey0F172A = Color(0xFF0F172A);
  static const grey6F767E = Color(0xFF6F767E);
  static const greyF2F4FA = Color(0xFFF2F4FA);
  static const grey64748B = Color(0xFF64748B);
  static const grey94A3B8 = Color(0xFF94A3B8);
  static const grey93989A = Color(0xFF93989A);
  static const grey8F95B2 = Color(0xFF8f95B2);
  static const greyD1D5DB = Color(0xFFD1D5DB);

  static const green21CCC3 = Color(0xFF21CCC3);

  static const redFF0004 = Color(0xFFFF0004);
  static const redFF0000 = Color(0xFFFF0000);

  static const white = Colors.white;
}

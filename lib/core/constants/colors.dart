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

  static const black = Color(0xFF000000);
  static const black111827 = Color(0xFF111827);
  static const black171725 = Color(0xFF171725);
  static const black262C38 = Color(0xFF262C38);
  static const black4A4A4A = Color(0xFF4A4A4A);
  static const black0D0D0D = Color(0xFF0D0D0D);

  static const greyC3D3D9 = Color(0xFFC3D3D9);
  static const greyE4E4E4 = Color(0xFFE4E4E4);
  static const greyF1F5F9 = Color(0xFFF1F5F9);
  static const grey334155 = Color(0xFF334155);
  static const grey1E293B = Color(0xFF1E293B);

  static const secondary = Color(0xFF005AA9);
  static const blue005AA9 = Color(0xFF005AA9);
  static const blue005BAA = Color(0xFF005BAA);
  static const blue005EB8 = Color(0xFF005EB8);
  static const blue085DA8 = Color(0xFF085DA8);
  static const blue374151 = Color(0xFF374151);
  static const blue3B82F6 = Color(0xFF3B82F6);
  static const blue64748B = Color(0xFF64748B);
  static const blueD7F1FF = Color(0xFFD7F1FF);
  static const blue15ABFF = Color(0xFF15ABFF);
  static const blue3182CE = Color(0xFF3182CE);
  static const blueE7F3FF = Color(0xFFE7F3FF);
  static const blueDAE3FF = Color(0xFFDAE3FF);
  static const blueD7E5F1 = Color(0xFFD7E5F1);
  static const blueEFF6FF = Color(0xFFEFF6FF);

  static const greyDFDFDF = Color(0xFFDFDFDF);
  static const greyE2E8F0 = Color(0xFFE2E8F0);
  static const greyEFEFEF = Color(0xFFEFEFEF);
  static const greyE9E9E9 = Color(0xFFE9E9E9);
  static const greyE3F0FF = Color(0xFFE3F0FF);
  static const greyFBFBFB = Color(0xFFFBFBFB);
  static const grey92929D = Color(0xFF92929D);
  static const grey0F172A = Color(0xFF0F172A);
  static const grey4B5563 = Color(0xFF4B5563);
  static const grey6F767E = Color(0xFF6F767E);
  static const grey6F6F6F = Color(0xFF6F6F6F);
  static const greyF2F4FA = Color(0xFFF2F4FA);
  static const greyF2F2F2 = Color(0xFFF2F2F2);
  static const greyF2F4F6 = Color(0xFFF2F4F6);
  static const greyAthens = Color(0xFFF3F4F6);
  static const grey64748B = Color(0xFF64748B);
  static const grey94A3B8 = Color(0xFF94A3B8);
  static const grey93989A = Color(0xFF93989A);
  static const grey8F95B2 = Color(0xFF8f95B2);
  static const greyD1D5DB = Color(0xFFD1D5DB);
  static const grey666666 = Color(0xFF666666);
  static const greyE5E5E5 = Color(0xFFE5E5E5);
  static const greyE5E7EB = Color(0xFFE5E7EB);
  static const greyF5F5F5 = Color(0xFFF5F5F5);
  static const greyF9FAFB = Color(0xFFF9FAFB);
  static const greyCACACA = Color(0xFFCACACA);

  static const green21CCC3 = Color(0xFF21CCC3);

  static const orangeFF9100 = Color(0xFFFF9100);

  static const redFF0004 = Color(0xFFFF0004);
  static const redFF0000 = Color(0xFFFF0000);
  static const redFF0909 = Color(0xFFFF0909);
  static const redFF2F2F = Color(0xFFFF2F2F);

  static const white = Colors.white;

  static const yellowFFFBEB = Color(0xFFFFFBEB);
}

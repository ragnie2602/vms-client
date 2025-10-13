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
}

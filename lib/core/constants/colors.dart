import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';

class AppColors {
  const AppColors._();

  static bool get isDarkMode =>
      AppRouter.rootNavigatorKey.currentContext?.let(
        (context) => Theme.of(context).brightness == Brightness.dark,
      ) ??
      true;

  static const primary = Color(0xFF15ABFF);

  static const scaffoldBgLight = Color(0xFFF8F9FE);
  static const scaffoldBgDark = Color(0xFF212434);
  static Color get scaffoldBg => isDarkMode ? scaffoldBgDark : scaffoldBgLight;

  static const contentBgLight = Colors.white;
  static const contentBgDark = Color(0xFF1D1F2B);
  static Color get contentBg => isDarkMode ? contentBgDark : contentBgLight;

  static const contentFgLight = Color(0xFF000000);
  static const contentFgDark = Color(0xFFC3D3D9);
  static Color get contentFg => isDarkMode ? contentFgDark : contentFgLight;

  static const black171725 = Color(0xFF171725);

  static const secondary = Color(0xFF005AA9);

  static const greyE2E8F0 = Color(0xFFE2E8F0);
  static const grey64748B = Color(0xFF64748B);
  static const green21CCC3 = Color(0xFF21CCC3);
}

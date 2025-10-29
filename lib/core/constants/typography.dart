import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class AppTypography {
  const AppTypography._();

  static Color _getColor(Color? lightColor, Color? darkColor, Color? color) {
    return color ??
        (AppColors.isDarkMode
            ? darkColor ?? AppColors.contentFgDark
            : lightColor ?? AppColors.contentFgLight);
  }

  static TextStyle style(
    double fontSize, {
    FontWeight fontWeight = FontWeight.w400,
    bool isItalic = false,
    Color? lightColor,
    Color? darkColor,
    Color? color,
    double lineHeight = 1.0,
    double letterSpacing = 0.0,
    TextOverflow textOverflow = TextOverflow.ellipsis
  }) => TextStyle(
    fontFamily: 'Inter',
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    color: _getColor(lightColor, darkColor, color),
    height: lineHeight,
    letterSpacing: letterSpacing,
    overflow: textOverflow
  );
}

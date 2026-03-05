import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class ToastUtil {
  static void mobileToast({
    BuildContext? context,
    Widget? title,
    String? message,
    Alignment? alignment,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: alignment,
      builder: (context, item) => Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: title ?? Text(message ?? 'Thành công!', style: _toastStyle),
        ),
      ),
    );
  }

  static TextStyle get _toastStyle => AppTypography.style(
    14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    lineHeight: 18 / 14,
  );

  static toastSuccess({
    BuildContext? context,
    Widget? title,
    Alignment? alignment,
    String? message,
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, message: message, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title ?? Text(message ?? 'Thành công!', style: _toastStyle),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
      );
    }
  }

  static void toastFail({
    BuildContext? context,
    Widget? title,
    Alignment? alignment,
    String? message,
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, message: message, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title ?? Text(message ?? 'Thất bại', style: _toastStyle),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
      );
    }
  }

  static void toastWarning({
    BuildContext? context,
    Widget? title,
    int autoCloseDuration = 3,
    Alignment? alignment,
    String? message,
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, message: message, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title ?? Text(message ?? 'Cảnh báo', style: _toastStyle),
        autoCloseDuration: Duration(seconds: autoCloseDuration),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
      );
    }
  }
}

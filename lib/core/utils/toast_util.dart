import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static void mobileToast({BuildContext? context, Widget? title, Alignment? alignment}) {
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
          child: title ?? Text('Thành công!', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  static toastSuccess({BuildContext? context, Widget? title, Alignment? alignment}) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title ?? Text('Thành công!'),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
      );
    }
  }

  static void toastFail({BuildContext? context, Widget? title, Alignment? alignment}) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title ?? Text('Thất bại'),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
      );
    }
  }

  static void toastWarning({
    BuildContext? context,
    required Widget title,
    int autoCloseDuration = 3,
    Alignment? alignment
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title, alignment: alignment);
    } else {
      toastification.show(
        context: context,
        alignment: alignment,
        title: title,
        autoCloseDuration: Duration(seconds: autoCloseDuration),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
      );
    }
  }
}

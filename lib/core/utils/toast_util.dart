import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static void mobileToast({BuildContext? context, Widget? title}) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.center,
      builder: (context, item) => Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(8),
          ),
          child: title ?? Text('Thành công!', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  static toastSuccess({BuildContext? context, Widget? title}) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title);
    } else {
      toastification.show(
        context: context,
        title: title ?? Text('Thành công!'),
        autoCloseDuration: const Duration(seconds: 3),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
      );
    }
  }

  static void toastFail({BuildContext? context, Widget? title}) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title);
    } else {
      toastification.show(
        context: context,
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
  }) {
    if (Platform.isAndroid || Platform.isIOS) {
      mobileToast(context: context, title: title);
    } else {
      toastification.show(
        context: context,
        title: title,
        autoCloseDuration: Duration(seconds: autoCloseDuration),
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static toastSuccess({BuildContext? context, Widget? title}) {
    toastification.show(
      context: context,
      title: title ?? Text('Thành công!'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
    );
  }

  static void toastFail({BuildContext? context, Widget? title}) {
    toastification.show(
      context: context,
      title: title ?? Text('Thất bại'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
    );
  }

  static void toastWarning({
    BuildContext? context,
    required Widget title,
    int autoCloseDuration = 3,
  }) {
    toastification.show(
      context: context,
      title: title,
      autoCloseDuration: Duration(seconds: autoCloseDuration),
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
    );
  }
}

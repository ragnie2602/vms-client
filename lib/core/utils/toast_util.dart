import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static toastSuccess({required BuildContext context, Widget? title}) {
    toastification.show(
      context: context,
      title: title ?? Text('Thành công!'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
    );
  }

  static void toastFail({required BuildContext context, Widget? title}) {
    toastification.show(
      context: context,
      title: title ?? Text('Thất bại'),
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
    );
  }
}

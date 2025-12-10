import 'package:flutter/material.dart';
import 'package:vms_flutter_client/screens/home/widgets/change_my_password_form.dart';

/// Hiển thị dialog khôi phục mật khẩu.
/// Trả về mật khẩu mới nếu người dùng xác nhận, ngược lại trả về null.
Future<bool?> showChangeMyPasswordDialog(BuildContext context) {
  return showDialog<bool?>(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(child: ChangeMyPasswordForm(isDialog: true)),
        ),
      );
    },
  );
}

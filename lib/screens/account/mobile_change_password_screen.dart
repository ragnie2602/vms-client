import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/widgets/change_my_password_form.dart';

class MobileChangePasswordScreen extends StatelessWidget {
  const MobileChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.black),
        ),
        title: Text(
          'Đổi mật khẩu',
          style: AppTypography.style(18, fontWeight: FontWeight.w600, color: AppColors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children: [ChangeMyPasswordForm(isDialog: false, onCancel: () => context.pop())]),
      ),
    );
  }
}

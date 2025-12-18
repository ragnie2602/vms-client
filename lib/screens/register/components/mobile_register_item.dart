import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

enum ValidationType { account, password, confirmPassword }

class MobileRegisterItem extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final ValidationType validationType;
  final TextEditingController? passwordController;

  const MobileRegisterItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.validationType,
    this.obscureText = false,
    this.passwordController,
  });

  @override
  State<MobileRegisterItem> createState() => MobileRegisterItemState();
}

class MobileRegisterItemState extends State<MobileRegisterItem> {
  String? errorText;
  bool obscureText = false;
  Timer? _hidePasswordTimer;

  @override
  void initState() {
    super.initState();
    if (mounted) obscureText = widget.obscureText;
  }

  bool validate() {
    String? error = _getValidationError();
    setState(() => errorText = error);
    return error == null;
  }

  String? _getValidationError() {
    final text = widget.controller.text;

    if (text.isEmpty) {
      return '${widget.label} không được để trống';
    }

    switch (widget.validationType) {
      case ValidationType.account:
        // Check for special symbols and spaces
        final invalidCharsRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>\s]');
        if (invalidCharsRegex.hasMatch(text)) {
          return 'Tên tài khoản không được chứa ký tự đặc biệt hoặc khoảng trắng';
        }
        break;

      case ValidationType.password:
        if (text.length < 6) {
          return 'Mật khẩu phải có ít nhất 6 ký tự';
        }
        break;

      case ValidationType.confirmPassword:
        if (widget.passwordController != null &&
            text != widget.passwordController!.text) {
          return 'Mật khẩu xác nhận không khớp';
        }
        break;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTypography.style(13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.greyE2E8F0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorText: errorText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: AppColors.secondary),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.red),
            ),
            hintStyle: AppTypography.style(
              14,
              color: AppColors.grey92929D,
              fontWeight: FontWeight.w400,
            ),
            hintText: widget.hintText,
            isDense: true,
            suffixIcon: widget.obscureText
                ? InkWell(
                    onTap: showPassword,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: SvgPicture.asset(
                        obscureText ? AppAssets.icEyeOpened : AppAssets.icEyeClosed,
                        height: 24,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 64),
          ),
          obscuringCharacter: '*',
          obscureText: obscureText,
          onChanged: (_) {
            // Clear error when user starts typing
            if (errorText != null) {
              setState(() => errorText = null);
            }
          },
          style: AppTypography.style(14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _hidePasswordTimer?.cancel();
    super.dispose();
  }

  showPassword() {
    setState(() => obscureText = !obscureText);
    _hidePasswordTimer?.cancel();

    if (!obscureText) {
      _hidePasswordTimer = Timer(const Duration(seconds: 5), () {
        if (mounted) setState(() => obscureText = true);
      });
    }
  }
}

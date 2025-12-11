import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class MobileLoginItem extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const MobileLoginItem({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  State<MobileLoginItem> createState() => _MobileLoginItemState();
}

class _MobileLoginItemState extends State<MobileLoginItem> {
  String? errorText;
  bool obscureText = false;
  Timer? _hidePasswordTimer;

  @override
  void initState() {
    super.initState();
    if (mounted) obscureText = widget.obscureText;
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
            hintStyle: AppTypography.style(14, fontWeight: FontWeight.w400),
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
          onChanged: (_) => setState(
            () => errorText = widget.controller.text.isEmpty
                ? '${widget.label} không được để trống'
                : null,
          ),
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

import 'package:flutter/material.dart';
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
          ),
          obscuringCharacter: '*',
          obscureText: widget.obscureText,
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
}

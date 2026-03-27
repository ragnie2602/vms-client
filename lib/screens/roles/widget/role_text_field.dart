import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class RoleTextField extends StatefulWidget {
  final Color? borderColor;
  final Color? fillColor;
  final String hintText;
  final bool isRequired;
  final String label;
  final int? maxLength;
  final Function(String) onChanged;
  final TextEditingController controller;
  final Widget? prefixIcon;

  const RoleTextField({
    super.key,
    this.borderColor,
    this.fillColor,
    required this.hintText,
    this.isRequired = false,
    required this.label,
    required this.onChanged,
    required this.controller,
    this.prefixIcon,
    this.maxLength,
  });

  @override
  State<RoleTextField> createState() => _RoleTextFieldState();
}

class _RoleTextFieldState extends State<RoleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: AppTypography.style(13, fontWeight: FontWeight.w400, color: AppColors.black),
            ),
            if (widget.isRequired)
              Text(
                ' *',
                style: AppTypography.style(
                  13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.redFF0004,
                ),
              ),
          ],
        ),
        TextField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: widget.borderColor ?? AppColors.greyE2E8F0, width: 1),
            ),
            constraints: BoxConstraints(minHeight: 0, minWidth: 0),
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            counter: Container(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: widget.borderColor ?? AppColors.greyE2E8F0, width: 1),
            ),
            fillColor: widget.fillColor ?? AppColors.white,
            filled: widget.fillColor != null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: AppColors.greyE2E8F0, width: 1),
            ),
            hintStyle: AppTypography.style(
              14,
              color: AppColors.grey64748B,
              fontWeight: FontWeight.w400,
            ),
            hintText: widget.hintText,
            isDense: true,
            prefixIcon: widget.prefixIcon != null
                ? Padding(padding: const EdgeInsets.all(12), child: widget.prefixIcon)
                : null,
            prefixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
          ),
          maxLength: widget.maxLength,
          style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.black),
        ),
      ],
    );
  }
}

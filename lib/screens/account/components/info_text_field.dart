import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class InfoTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;
  final String hintText;
  final String label;
  final int? maxLength;
  final String? regExp;

  const InfoTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    required this.hintText,
    required this.label,
    this.maxLength,
    this.regExp,
  });

  @override
  State<InfoTextField> createState() => _InfoTextFieldState();
}

class _InfoTextFieldState extends State<InfoTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTypography.style(13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Container(
          color: widget.enabled ? Colors.transparent : AppColors.greyF2F4FA,
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(color: AppColors.greyE2E8F0),
              ),
              enabled: widget.enabled,
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
            maxLength: widget.maxLength,
            onChanged: onChanged,
            style: AppTypography.style(14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  void onChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        errorText = '${widget.label} không được để trống';
      } else if (widget.regExp != null && !RegExp(widget.regExp!).hasMatch(value)) {
        errorText = '${widget.label} không đúng định dạng!';
      } else {
        errorText = null;
      }
    });
  }
}

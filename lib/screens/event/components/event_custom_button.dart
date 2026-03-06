import 'package:flutter/material.dart';

class EventCustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final double? borderRadius;
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? prefix;
  final double? prefixGap;
  final Widget? suffixIcon;
  final double? suffixIconGap;
  final TextStyle? textStyle;

  const EventCustomButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.boxShadow,
    this.borderRadius,
    required this.label,
    required this.onPressed,
    this.padding,
    this.prefixGap,
    this.prefix,
    this.suffixIcon,
    this.suffixIconGap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        boxShadow: boxShadow,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          side: borderColor != null ? BorderSide(color: borderColor!, width: 1) : null,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null) prefix!,
              if (prefixGap != null) SizedBox(width: prefixGap!),
              Text(label, style: textStyle),
              if (suffixIcon != null) SizedBox(width: suffixIconGap ?? 8),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}

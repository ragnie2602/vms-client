import 'package:flutter/material.dart';

class EventCustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const EventCustomButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    required this.label,
    required this.onPressed,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        side: borderColor != null ? BorderSide(color: borderColor!, width: 1) : null,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(label, style: textStyle),
      ),
    );
  }
}

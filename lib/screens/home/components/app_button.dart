import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class AppButton extends StatelessWidget {
  const AppButton._(
    this.label,

    this.onPressed,

    this.filled,

    this.fullWidth, {

    super.key,

    this.child,

    this.borderColor,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final Widget? child;
  final bool fullWidth;
  final Color? borderColor;

  factory AppButton.filled({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    Widget? child,
    bool fullWidth = false,
  }) => AppButton._(label, onPressed, true, fullWidth, key: key, child: child);
  factory AppButton.outline({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool fullWidth = false,
    Color? borderColor,
    Widget? child,
  }) => AppButton._(
    label,
    onPressed,
    false,
    fullWidth,
    key: key,
    borderColor: borderColor,
    child: child,
  );

  @override
  Widget build(BuildContext context) {
    final buttonChild =
        child ??
        Text(
          label,
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: filled ? AppColors.white : null,
          ),
        );

    if (filled) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue005AA9,
          foregroundColor: Colors.white,
          disabledBackgroundColor: AppColors.blue005AA9.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          minimumSize: fullWidth
              ? const Size(double.infinity, 48)
              : const Size(150, 48),
          elevation: 0,
        ),
        child: buttonChild,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(
            color: borderColor ?? AppColors.greyC3D3D9,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: fullWidth
              ? const Size(double.infinity, 48)
              : const Size(150, 48),
          backgroundColor: Colors.white,
        ),
        child: buttonChild,
      );
    }
  }
}

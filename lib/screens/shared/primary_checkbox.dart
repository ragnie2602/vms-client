import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

class PrimaryCheckbox extends StatelessWidget {
  final Function(bool) onChanged;
  final bool value;
  final double size;
  final double borderRadius;
  final double borderWidth;

  const PrimaryCheckbox({
    super.key,
    this.borderRadius = 3,
    this.borderWidth = 1,
    required this.onChanged,
    this.size = 14,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = value ? AppColors.secondary : AppColors.greyE2E8F0;
    final Color fillColor = value ? AppColors.secondary : Colors.white;

    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () => onChanged(!value),
        child: Container(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: value
              ? Center(
                  child: Icon(Icons.check, size: size * 0.65, color: Colors.white),
                )
              : null,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';

/// Custom Radio Button Widget
class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({super.key, required this.title, required this.value, required this.groupValue, required this.onChanged});

  final String title;
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.black : Colors.transparent,
              border: Border.all(color: AppColors.black, width: 1.5),
            ),
            child: Icon(Icons.check_rounded, size: 14, color: isSelected ? Colors.white : Colors.transparent),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF000000)),
          ),
        ],
      ),
    );
  }
}

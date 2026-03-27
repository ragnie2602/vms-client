import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class LicenseSectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const LicenseSectionHeader({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.greyF9F9F9,
        border: Border(bottom: BorderSide(color: AppColors.greyE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.black111827),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTypography.style(
              11,
              fontWeight: FontWeight.w700,
              lineHeight: 1.5,
              letterSpacing: 1.1,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

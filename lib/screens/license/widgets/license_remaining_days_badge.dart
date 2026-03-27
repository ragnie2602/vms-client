import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class LicenseRemainingDaysBadge extends StatelessWidget {
  final String text;

  const LicenseRemainingDaysBadge({super.key, this.text = 'CÒN 25 NGÀY'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTypography.style(
          12,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFD97706),
        ),
      ),
    );
  }
}

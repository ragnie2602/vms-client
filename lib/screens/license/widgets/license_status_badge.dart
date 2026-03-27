import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class LicenseStatusBadge extends StatelessWidget {
  const LicenseStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF16A34A),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'Đang hoạt động',
            style: AppTypography.style(
              12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF16A34A),
            ),
          ),
        ],
      ),
    );
  }
}

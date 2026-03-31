import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';

class LicenseStatusBadge extends StatelessWidget {
  final LicenseStatus? status;

  const LicenseStatusBadge({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor = const Color(0xFFF1F5F9);
    Color fgColor = const Color(0xFF475569);
    String label = 'Không xác định';

    switch (status) {
      case LicenseStatus.active:
        bgColor = const Color(0xFFDCFCE7);
        fgColor = const Color(0xFF16A34A);
        label = 'Đang hoạt động';
        break;
      case LicenseStatus.expired:
        bgColor = const Color(0xFFFEE2E2);
        fgColor = const Color(0xFFDC2626);
        label = 'Hết hạn';
        break;
      case LicenseStatus.notActivated:
        bgColor = const Color(0xFFF1F5F9);
        fgColor = const Color(0xFF475569);
        label = 'Chưa kích hoạt';
        break;
      case LicenseStatus.invalidFile:
        bgColor = const Color(0xFFFFEDD5);
        fgColor = const Color(0xFFEA580C);
        label = 'Không hợp lệ';
        break;
      default:
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: fgColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTypography.style(
              12,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}

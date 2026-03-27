import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

class Step3Complete extends StatelessWidget {
  const Step3Complete({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 48),
        SvgPicture.asset(AppAssets.icSuccessLicense),
        const SizedBox(height: 32),
        Text(
          'Kích hoạt gói dịch vụ thành công!',
          style: AppTypography.style(
            32,
            fontWeight: FontWeight.w700,
            lineHeight: 0.94,
            letterSpacing: -0.6,
            color: AppColors.grey0F172A,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Tài nguyên hệ thống đã được cập nhật. Bạn có thể bắt đầu sử dụng các\ntính năng mới ngay bây giờ.',
          style: AppTypography.style(
            16,
            fontWeight: FontWeight.w500,
            color: AppColors.grey334155,
            lineHeight: 1.25,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

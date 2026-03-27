import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/home/components/app_button.dart';
import 'package:vms_flutter_client/screens/license/widgets/license_feature_group.dart';
import 'package:vms_flutter_client/screens/license/widgets/license_info_row.dart';
import 'package:vms_flutter_client/screens/license/widgets/license_remaining_days_badge.dart';
import 'package:vms_flutter_client/screens/license/widgets/license_section_header.dart';
import 'package:vms_flutter_client/screens/license/widgets/license_status_badge.dart';

class Step2ReviewInfo extends StatelessWidget {
  final bool isDetailMode;
  final VoidCallback? onUpdatePackage;

  const Step2ReviewInfo({
    super.key,
    this.isDetailMode = false,
    this.onUpdatePackage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isDetailMode) ...[
          Text(
            'Kiểm tra thông tin',
            style: AppTypography.style(
              34,
              lineHeight: 0.94,
              letterSpacing: -0.6,
              fontWeight: FontWeight.w700,
              color: AppColors.grey0F172A,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Vui lòng rà soát lại các thông tin gói dịch vụ trước khi xác nhận kích hoạt.',
            style: AppTypography.style(
              16,
              fontWeight: FontWeight.w500,
              lineHeight: 1.25,
              color: AppColors.grey334155,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
        ],
        Container(
          width: 800,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE5E7EB),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isDetailMode)
                const LicenseSectionHeader(
                  icon: Icons.description_outlined,
                  title: 'THÔNG TIN CHUNG',
                ),
              LicenseInfoRow(
                'Gói dịch vụ',
                'Gói VMS Enterprise - Phân hệ Trường học',
                isBoldValue: true,
                actionWidget: isDetailMode
                    ? SizedBox(
                        height: 36,
                        child: AppButton.filled(
                          label: 'Cập nhật gói',
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          backgroundColor: AppColors.blue137FEC,
                          onPressed: onUpdatePackage,
                        ),
                      )
                    : null,
              ),
              if (isDetailMode) ...[
                LicenseInfoRow(
                  'Trạng thái',
                  '',
                  badgeWidget: const LicenseStatusBadge(),
                ),
                const LicenseInfoRow(
                  'Mã khách hàng',
                  'KH-001',
                  isBoldValue: true,
                ),
              ],
              const LicenseInfoRow('Ngày kích hoạt', '01/01/2025'),
              LicenseInfoRow(
                'Ngày hết hạn',
                '31/12/2025',
                badgeWidget: isDetailMode
                    ? const LicenseRemainingDaysBadge()
                    : null,
              ),

              const LicenseSectionHeader(
                icon: Icons.devices_outlined,
                title: 'GIỚI HẠN THIẾT BỊ',
              ),
              const LicenseInfoRow(
                'Số lượng Camera',
                '10 Thiết bị',
                valueHighlight: '10',
              ),
              const LicenseInfoRow(
                'Số lượng AI Box',
                '05 Thiết bị',
                valueHighlight: '05',
              ),

              const LicenseSectionHeader(
                icon: Icons.list_alt_outlined,
                title: 'DANH SÁCH TÍNH NĂNG',
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LicenseFeatureGroup(
                      title: 'TÍNH NĂNG GIÁM SÁT CAMERA',
                      badgeText: isDetailMode ? null : 'Core VMS',
                      badgeBgColor: AppColors.blueEFF6FF,
                      badgeTextColor: AppColors.blue2563EB,
                      badgeBorderColor: AppColors.blueDBEAFE,
                      isDetailMode: isDetailMode,
                      features: const [
                        'Xem trực tiếp (Liveview)',
                        'Xem lại (Playback)',
                        'Quản lý thiết bị',
                        'Bản đồ camera',
                        'Quản lý đối tượng',
                        'Tài khoản & Phân quyền',
                      ],
                    ),
                    const SizedBox(height: 32),
                    LicenseFeatureGroup(
                      title: 'TÍNH NĂNG CẢNH BÁO AI',
                      badgeText: isDetailMode ? null : 'AI Enabled',
                      badgeBgColor: AppColors.purpleFAF5FF,
                      badgeTextColor: AppColors.purple9333EA,
                      badgeBorderColor: AppColors.purpleF3E8FF,
                      isDetailMode: isDetailMode,
                      features: [
                        isDetailMode
                            ? 'Nhận diện khuôn mặt (Tối đa 5 cam)'
                            : 'Nhận diện khuôn mặt (Max 20 cam)',
                        isDetailMode
                            ? 'Cảnh báo người lạ (Tối đa 5 cam)'
                            : 'Cảnh báo người lạ (Max 10 cam)',
                        isDetailMode
                            ? 'Cảnh báo xâm nhập (Tối đa 5 cam)'
                            : 'Cảnh báo xâm nhập (Max 50 cam)',
                        isDetailMode
                            ? 'Hành vi hút thuốc (Tối đa 5 cam)'
                            : 'Hành vi hút thuốc (Max 15 cam)',
                        isDetailMode
                            ? 'Cảnh báo tụ tập đông người (Tối đa 5 cam)'
                            : 'Cảnh báo tụ tập đông người (Max 10 cam)',
                        isDetailMode
                            ? 'Cảnh báo cháy & Khói (Tối đa 5 cam)'
                            : 'Cảnh báo cháy & Khói (Max 20 cam)',
                        isDetailMode
                            ? 'Cảnh báo sử dụng điện thoại (Tối đa 5 cam)'
                            : 'Cảnh báo sử dụng điện thoại (Max 20 cam)',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!isDetailMode) ...[
          const SizedBox(height: 32),
          Container(
            width: 800,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blueE7F2FD,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.iconWarningCodeLicense,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Vui lòng kiểm tra kỹ mọi thông tin trên. Khi nhấn "Xác nhận kích hoạt", hệ thống tiến hành cấu hình vĩnh viễn cho định danh thiết bị này.',
                    maxLines: 2,
                    style: AppTypography.style(
                      13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue006DDB,
                      lineHeight: 1.54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

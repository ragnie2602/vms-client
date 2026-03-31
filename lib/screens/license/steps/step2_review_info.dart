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
import 'package:vms_flutter_client/domain/entities/license/current_license_data.dart';
import 'package:vms_flutter_client/domain/entities/license/license_preview_data.dart';

class Step2ReviewInfo extends StatelessWidget {
  final bool isDetailMode;
  final VoidCallback? onUpdatePackage;
  final LicensePreviewData? previewData;
  final CurrentLicenseData? currentLicense;

  const Step2ReviewInfo({
    super.key,
    this.isDetailMode = false,
    this.onUpdatePackage,
    this.previewData,
    this.currentLicense,
  });

  @override
  Widget build(BuildContext context) {
    final payload = isDetailMode ? currentLicense?.license : previewData?.license;
    final status = isDetailMode ? currentLicense?.status : previewData?.previewStatus;

    // Tính remaining days nếu có expiryDate
    int? remainingDays;
    if (payload?.expiryDate != null) {
      final expiry = DateTime.tryParse(payload!.expiryDate!);
      if (expiry != null) {
        remainingDays = expiry.difference(DateTime.now()).inDays;
      }
    }

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
                payload?.packageName ?? '---',
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
                  badgeWidget: LicenseStatusBadge(status: status),
                ),
                LicenseInfoRow(
                  'Mã khách hàng',
                  payload?.customerId ?? '---',
                  isBoldValue: true,
                ),
              ],
              LicenseInfoRow('Ngày kích hoạt', payload?.issueDate ?? '---'),
              LicenseInfoRow(
                'Ngày hết hạn',
                payload?.expiryDate ?? '---',
                badgeWidget: isDetailMode && remainingDays != null && remainingDays > 0
                    ? LicenseRemainingDaysBadge(text: 'CÒN $remainingDays NGÀY')
                    : null,
              ),

              const LicenseSectionHeader(
                icon: Icons.devices_outlined,
                title: 'GIỚI HẠN THIẾT BỊ',
              ),
              LicenseInfoRow(
                'Số lượng Camera',
                '${payload?.maxCameras ?? 0} Thiết bị',
                valueHighlight: '${payload?.maxCameras ?? 0}',
              ),
              LicenseInfoRow(
                'Số lượng AI Box',
                '${payload?.maxAiBoxes ?? 0} Thiết bị',
                valueHighlight: '${payload?.maxAiBoxes ?? 0}',
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
                      features: payload?.systemFeatures.map((f) => f.featureName ?? '').toList() ?? const [],
                    ),
                    const SizedBox(height: 32),
                    LicenseFeatureGroup(
                      title: 'TÍNH NĂNG CẢNH BÁO AI',
                      badgeText: isDetailMode ? null : 'AI Enabled',
                      badgeBgColor: AppColors.purpleFAF5FF,
                      badgeTextColor: AppColors.purple9333EA,
                      badgeBorderColor: AppColors.purpleF3E8FF,
                      isDetailMode: isDetailMode,
                      features: payload?.aiFeatures.map((f) {
                        return isDetailMode 
                            ? '${f.featureName} (Tối đa ${f.allowedCameras} cam)'
                            : '${f.featureName} (Max ${f.allowedCameras} cam)';
                      }).toList() ?? const [],
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

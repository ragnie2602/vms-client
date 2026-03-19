import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_alert_entity.dart';

class NotificationAlertPopup extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onViewMore;

  const NotificationAlertPopup({
    super.key,
    required this.onClose,
    this.onViewMore,
  });

  /// Dữ liệu mẫu - thay thế bằng API khi có
  static List<NotificationAlertEntity> get sampleAlerts => [
    NotificationAlertEntity(
      id: '1',
      alertType: AlertType.intrusion,
      message: 'Phát hiện xâm nhập tại khu vực',
      categoryLabel: 'Cảnh báo xâm nhập',
      time: '08:00 - 02/02/2026',
      cameraName: 'Camera 01',
      cameraGroupName: 'Camera BGH',
    ),
    NotificationAlertEntity(
      id: '2',
      alertType: AlertType.crowding,
      message: 'Phát hiện tụ tập đông người tại khu vực',
      categoryLabel: 'Cảnh báo tụ tập',
      time: '08:00 - 02/02/2026',
      cameraName: 'Camera 01',
      cameraGroupName: 'Camera BGH',
    ),
    NotificationAlertEntity(
      id: '3',
      alertType: AlertType.phoneUsage,
      message: 'Phát hiện hành vi sử dụng điện thoại tại khu vực',
      categoryLabel: 'Sử dụng điện thoại',
      time: '08:00 - 02/02/2026',
      cameraName: 'Camera 01',
      cameraGroupName: 'Camera BGH',
    ),
    NotificationAlertEntity(
      id: '4',
      alertType: AlertType.smoking,
      message: 'Phát hiện hành vi hút thuốc tại khu vực',
      categoryLabel: 'Cảnh báo hút thuốc',
      time: '08:00 - 02/02/2026',
      cameraName: 'Camera 01',
      cameraGroupName: 'Camera BGH',
    ),
    NotificationAlertEntity(
      id: '5',
      alertType: AlertType.fire,
      message: 'Phát hiện dấu hiệu cháy tại khu vực',
      categoryLabel: 'Cảnh báo cháy',
      time: '08:00 - 02/02/2026',
      cameraName: 'Camera 01',
      cameraGroupName: null,
    ),
    NotificationAlertEntity(
      id: '6',
      alertType: AlertType.objectDetection,
      message: 'Nhận diện',
      categoryLabel: '',
      time: '08:00 - 02/02/2026',
      cameraName: null,
      cameraGroupName: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final alerts = sampleAlerts;

    return Container(
      width: 420,
      constraints: BoxConstraints(maxHeight: 520),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Cảnh báo',
              style: AppTypography.style(
                18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
          const Divider(height: 1, color: AppColors.greyE2E8F0),

          // Alert List
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: alerts.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: AppColors.greyE2E8F0),
              itemBuilder: (context, index) =>
                  _NotificationAlertItem(alert: alerts[index]),
            ),
          ),

          // "Xem thêm" link
          const Divider(height: 1, color: AppColors.greyE2E8F0),
          InkWell(
            onTap: onViewMore,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                'Xem thêm',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue3B82F6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationAlertItem extends StatelessWidget {
  final NotificationAlertEntity alert;

  const _NotificationAlertItem({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          _buildAlertIcon(),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAlertMessage(),
                if (alert.categoryLabel.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '[${alert.categoryLabel}]',
                        style: AppTypography.style(
                          12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey64748B,
                        ),
                      ),
                      if (alert.time.isNotEmpty) ...[
                        const Spacer(),
                        Text(
                          alert.time,
                          style: AppTypography.style(
                            12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey64748B,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertMessage() {
    switch (alert.alertType) {
      case AlertType.intrusion:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      case AlertType.crowding:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      case AlertType.phoneUsage:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      case AlertType.smoking:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      case AlertType.fire:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: '${alert.cameraName ?? ''}. ',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: 'Vui lòng kiểm tra ngay.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        );
      case AlertType.objectDetection:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: '[Loại Đối Tượng]',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' '),
              TextSpan(
                text: '[Tên Đối Tượng]',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      case AlertType.intrusionWarning:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(13, fontWeight: FontWeight.w400, color: AppColors.black),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      default:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(13, fontWeight: FontWeight.w400, color: AppColors.black),
            children: [
              TextSpan(text: '${alert.message} '),
              TextSpan(
                text: alert.cameraName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' thuộc nhóm '),
              TextSpan(
                text: alert.cameraGroupName ?? '',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
    }
  }

  Widget _buildAlertIcon() {
    final config = _getAlertIconConfig();
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: config.bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: config.icon),
    );
  }

  _AlertIconConfig _getAlertIconConfig() {
    switch (alert.alertType) {
      case AlertType.intrusion:
        return _AlertIconConfig(
          bgColor: const Color(0xFFFEE2E2),
          icon: SvgPicture.asset(
            AppAssets.icAlertIntrution,
            width: 20,
            height: 20,
          ),
        );
      case AlertType.crowding:
        return _AlertIconConfig(
          bgColor: const Color(0xFFFEF3C7),
          icon: Icon(Icons.groups, size: 20, color: Color(0xFFD97706)),
        );
      case AlertType.phoneUsage:
        return _AlertIconConfig(
          bgColor: const Color(0xFFFFE4E6),
          icon: Icon(Icons.phone_android, size: 20, color: Color(0xFFE11D48)),
        );
      case AlertType.smoking:
        return _AlertIconConfig(
          bgColor: const Color(0xFFE0E7FF),
          icon: Icon(Icons.smoking_rooms, size: 20, color: Color(0xFF4F46E5)),
        );
      case AlertType.fire:
        return _AlertIconConfig(
          bgColor: const Color(0xFFFFF7ED),
          icon: Icon(
            Icons.local_fire_department,
            size: 20,
            color: Color(0xFFEA580C),
          ),
        );
      case AlertType.objectDetection:
        return _AlertIconConfig(
          bgColor: const Color(0xFFECFDF5),
          icon: Icon(Icons.person_search, size: 20, color: Color(0xFF059669)),
        );
      case AlertType.intrusionWarning:
        return _AlertIconConfig(
          bgColor: const Color(0xFFFFF2E2),
          icon: SvgPicture.asset(AppAssets.icAlertIntrution, width: 20, height: 20),
        );
      default:
        return _AlertIconConfig(
          bgColor: const Color(0xFFEF4444),
          icon: Icon(Icons.warning_amber_rounded, size: 20, color: Color(0xFFEF4444)),
        );
    }
  }
}

class _AlertIconConfig {
  final Color bgColor;
  final Widget icon;

  const _AlertIconConfig({required this.bgColor, required this.icon});
}

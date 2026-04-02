import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/notification/device_notification_entity.dart';

class DeviceNotificationPopup extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback? onViewMore;

  const DeviceNotificationPopup({super.key, required this.onClose, this.onViewMore});

  /// Dữ liệu mẫu - thay thế bằng API khi có
  static List<DeviceNotificationEntity> get sampleNotifications => [
    DeviceNotificationEntity(
      id: '1',
      type: DeviceNotificationType.cameraOffline,
      deviceName: 'Camera sảnh 1',
      groupName: 'Camera giám hiệu',
      time: '08:00 - 02/02/2026',
    ),
    DeviceNotificationEntity(
      id: '2',
      type: DeviceNotificationType.aiBoxOffline,
      deviceName: 'Box01',
      time: '08:00 - 02/02/2026',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final notifications = sampleNotifications;

    return Container(
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
      height: MediaQuery.heightOf(context) * 508 / 900,
      width: MediaQuery.widthOf(context) * 369 / 1600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text(
              'Thông báo',
              style: AppTypography.style(14, fontWeight: FontWeight.w600, color: AppColors.black),
            ),
          ),
          const Divider(height: 1, color: AppColors.greyE2E8F0),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const Divider(height: 1, color: AppColors.greyE2E8F0),
              itemBuilder: (context, index) =>
                  _DeviceNotificationItem(notification: notifications[index]),
            ),
          ),
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

class _DeviceNotificationItem extends StatelessWidget {
  final DeviceNotificationEntity notification;

  const _DeviceNotificationItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyE5E5E5),
            left: BorderSide(color: AppColors.greyE5E5E5),
            top: BorderSide(color: AppColors.greyE5E5E5),
          ),
          color: const Color(0xFFF2F4FA),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMessage(),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      notification.time,
                      style: AppTypography.style(
                        12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey6A6A6A,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage() {
    switch (notification.type) {
      case DeviceNotificationType.cameraOffline:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              14,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              lineHeight: 20 / 14,
            ),
            children: [
              const TextSpan(text: 'Camera '),
              TextSpan(
                text: notification.deviceName,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              if (notification.groupName != null) ...[
                const TextSpan(text: ' thuộc nhóm '),
                TextSpan(
                  text: notification.groupName,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
              const TextSpan(text: ' hiện đang ngoại tuyến. Vui lòng kiểm tra lại.'),
            ],
          ),
        );
      case DeviceNotificationType.aiBoxOffline:
        return RichText(
          text: TextSpan(
            style: AppTypography.style(
              14,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              lineHeight: 20 / 14,
            ),
            children: [
              const TextSpan(text: 'Thiết bị phân tích AI '),
              TextSpan(
                text: notification.deviceName,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const TextSpan(text: ' đang ngoại tuyến. Vui lòng kiểm tra lại.'),
            ],
          ),
        );
    }
  }

  Widget _buildIcon() {
    switch (notification.type) {
      case DeviceNotificationType.cameraOffline:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFE8EFF5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: SvgPicture.asset(AppAssets.icVideoOffline, width: 22, height: 22)),
        );
      case DeviceNotificationType.aiBoxOffline:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFEE2E2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'AI',
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFEF4444),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle),
                  child: const Icon(Icons.close, size: 9, color: Colors.white),
                ),
              ),
            ],
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/domain/entities/notification/notification_alert_entity.dart';

/// Popup hiển thị chi tiết cảnh báo với ảnh camera snapshot.
/// Dựa theo Figma: "Popup - Cấu hình cảnh báo" - Page "An ninh trường học"
class AlertDetailPopup extends StatelessWidget {
  final NotificationAlertEntity alert;
  final String? snapshotUrl;
  final String? cameraLabel;
  final VoidCallback? onClose;
  final VoidCallback? onCancel;
  final VoidCallback? onViewDetail;

  const AlertDetailPopup({
    super.key,
    required this.alert,
    this.snapshotUrl,
    this.cameraLabel,
    this.onClose,
    this.onCancel,
    this.onViewDetail,
  });

  /// Hiển thị popup dưới dạng dialog
  static Future<void> show(
    BuildContext context, {
    required NotificationAlertEntity alert,
    String? snapshotUrl,
    String? cameraLabel,
    VoidCallback? onViewDetail,
  }) {
    return showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (ctx) => Center(
        child: AlertDetailPopup(
          alert: alert,
          snapshotUrl: snapshotUrl,
          cameraLabel: cameraLabel,
          onClose: () => Navigator.of(ctx).pop(),
          onCancel: () => Navigator.of(ctx).pop(),
          onViewDetail: onViewDetail ?? () => Navigator.of(ctx).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 520,
        constraints: const BoxConstraints(maxHeight: 600),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 20,
              spreadRadius: 4,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildHeader(), _buildContent(), _buildFooter()],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // HEADER: Coral/red background với icon + title
  // ─────────────────────────────────────────────
  Widget _buildHeader() {
    final config = _getAlertHeaderConfig();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      decoration: BoxDecoration(
        color: config.bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          // Alert icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: config.icon),
          ),
          const SizedBox(width: 12),
          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  config.title,
                  style: AppTypography.style(
                    16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  config.subtitle,
                  style: AppTypography.style(
                    13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Close button
          InkWell(
            onTap: onClose,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(Icons.close, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // CONTENT: Camera snapshot + thông tin cảnh báo
  // ─────────────────────────────────────────────
  Widget _buildContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Camera snapshot image
          _buildCameraSnapshot(),
          const SizedBox(height: 16),
          // Info rows
          _buildInfoSection(),
        ],
      ),
    );
  }

  Widget _buildCameraSnapshot() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          // Snapshot image
          Container(
            width: double.infinity,
            height: 260,
            color: AppColors.greyE5E7EB,
            child: snapshotUrl != null && snapshotUrl!.isNotEmpty
                ? Image.network(
                    snapshotUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildPlaceholderImage(),
                    loadingBuilder: (_, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                          strokeWidth: 2,
                        ),
                      );
                    },
                  )
                : _buildPlaceholderImage(),
          ),
          // Camera label badge (bottom-right)
          if (cameraLabel != null && cameraLabel!.isNotEmpty)
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      size: 14,
                      color: AppColors.grey64748B,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      cameraLabel!,
                      style: AppTypography.style(
                        12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.videocam_off_outlined,
            size: 48,
            color: AppColors.grey94A3B8,
          ),
          const SizedBox(height: 8),
          Text(
            'Không có hình ảnh',
            style: AppTypography.style(13, color: AppColors.grey94A3B8),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        // Row 1: Loại sự kiện + Tên camera
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Loại sự kiện
            Expanded(
              child: _buildInfoItem(
                label: 'Loại sự kiện',
                value: alert.categoryLabel.isNotEmpty
                    ? alert.categoryLabel
                    : _getAlertHeaderConfig().title,
              ),
            ),
            const SizedBox(width: 16),
            // Tên camera
            Expanded(
              child: _buildInfoItem(
                label: 'Tên camera',
                value: alert.cameraName ?? '---',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Row 2: Thời gian cảnh báo
        Align(
          alignment: Alignment.centerLeft,
          child: _buildInfoItem(label: 'Thời gian cảnh báo', value: alert.time),
        ),
      ],
    );
  }

  Widget _buildInfoItem({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.style(
            13,
            fontWeight: FontWeight.w400,
            color: AppColors.grey64748B,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // FOOTER: Nút Hủy + Xem chi tiết
  // ─────────────────────────────────────────────
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFDFD),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border(top: BorderSide(color: AppColors.greyE5E7EB, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Nút Hủy
          SizedBox(
            height: 42,
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.black,
                side: BorderSide(color: AppColors.greyD1D5DB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32),
              ),
              child: Text(
                'Hủy',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Nút Xem chi tiết
          SizedBox(
            height: 42,
            child: ElevatedButton(
              onPressed: onViewDetail,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32),
              ),
              child: Text(
                'Xem chi tiết',
                style: AppTypography.style(
                  14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Config theo loại cảnh báo
  // ─────────────────────────────────────────────
  _AlertHeaderConfig _getAlertHeaderConfig() {
    switch (alert.alertType) {
      case AlertType.intrusion:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFEF4444),
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
            size: 22,
          ),
          title: 'Cảnh báo xâm nhập',
          subtitle: 'Phát hiện xâm nhập trái phép trong khuôn viên',
        );
      case AlertType.crowding:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFF59E0B),
          icon: const Icon(Icons.groups, color: Colors.white, size: 22),
          title: 'Cảnh báo tụ tập',
          subtitle: 'Phát hiện tụ tập đông người trong khuôn viên',
        );
      case AlertType.phoneUsage:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFE11D48),
          icon: const Icon(Icons.phone_android, color: Colors.white, size: 22),
          title: 'Sử dụng điện thoại',
          subtitle: 'Phát hiện hành vi sử dụng điện thoại trong khuôn viên',
        );
      case AlertType.smoking:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFFF5C66),
          icon: const Icon(Icons.smoking_rooms, color: Colors.white, size: 22),
          title: 'Cảnh báo hút thuốc',
          subtitle: 'Phát hiện hành vi hút thuốc lá trong khuôn viên',
        );
      case AlertType.fire:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFEA580C),
          icon: const Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 22,
          ),
          title: 'Cảnh báo cháy',
          subtitle: 'Phát hiện dấu hiệu cháy trong khuôn viên',
        );
      case AlertType.objectDetection:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFF059669),
          icon: const Icon(Icons.person_search, color: Colors.white, size: 22),
          title: 'Nhận diện đối tượng',
          subtitle: 'Phát hiện đối tượng trong khuôn viên',
        );
      case AlertType.intrusionWarning:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFFF8C00),
          icon:
          SvgPicture.asset(AppAssets.icAlertIntrusionWarning,
          width: 22, height: 22),
          title: 'Cảnh báo người lạ',
          subtitle: 'Phát hiện người lạ trong khuôn viên',
        );
      default:
        return _AlertHeaderConfig(
          bgColor: const Color(0xFFEF4444),
          icon: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 22),
          title: 'Cảnh báo không xác định',
          subtitle: 'Phát hiện sự kiện không xác định trong khuôn viên',
        );
    }
  }
}

class _AlertHeaderConfig {
  final Color bgColor;
  final Widget icon;
  final String title;
  final String subtitle;

  const _AlertHeaderConfig({
    required this.bgColor,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

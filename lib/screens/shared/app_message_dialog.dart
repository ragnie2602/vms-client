import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

enum AppMessageType { success, warning, error }

Future<void> showAppMessageDialog(
  BuildContext context, {
  required String message,
  String? title,
  AppMessageType type = AppMessageType.success,
  String okLabel = 'OK',
  VoidCallback? onOk,
  bool barrierDismissible = true,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) => Platform.isAndroid || Platform.isIOS
        ? MobileAppMessageDialog(
            title: title,
            message: message,
            type: type,
            okLabel: okLabel,
            onOk: onOk,
          )
        : AppMessageDialog(
            title: title,
            message: message,
            type: type,
            okLabel: okLabel,
            onOk: onOk,
          ),
  );
}

class AppMessageDialog extends StatelessWidget {
  const AppMessageDialog({
    super.key,
    this.title,
    required this.message,
    this.type = AppMessageType.success,
    this.okLabel = 'OK',
    this.onOk,
  });

  final String? title;
  final String message;
  final AppMessageType type;
  final String okLabel;
  final VoidCallback? onOk;

  Color _iconColor(BuildContext context) {
    switch (type) {
      case AppMessageType.success:
        return AppColors.green21CCC3;
      case AppMessageType.warning:
        return const Color(0xFFFFA000); // Amber 700
      case AppMessageType.error:
        return const Color(0xFFD32F2F); // Red 700
    }
  }

  IconData _iconData() {
    switch (type) {
      case AppMessageType.success:
        return Icons.check_circle;
      case AppMessageType.warning:
        return Icons.warning_amber_rounded;
      case AppMessageType.error:
        return Icons.error_outline;
    }
  }

  String _defaultTitle() {
    switch (type) {
      case AppMessageType.success:
        return 'Thành công';
      case AppMessageType.warning:
        return 'Cảnh báo';
      case AppMessageType.error:
        return 'Lỗi';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = _iconColor(context);

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      title: Row(
        children: [
          Icon(_iconData(), color: color, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title ?? _defaultTitle(),
              style: AppTypography.style(16, fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
            tooltip: 'Đóng',
          ),
        ],
      ),
      content: Text(message, style: const TextStyle(fontSize: 14, color: Color(0xFF000000))),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onOk?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              elevation: 0,
            ),
            child: Text(
              okLabel,
              style: AppTypography.style(14, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class MobileAppMessageDialog extends StatelessWidget {
  const MobileAppMessageDialog({
    super.key,
    this.title,
    required this.message,
    this.type = AppMessageType.success,
    this.okLabel = 'Thử lại',
    this.onOk,
  });

  final String? title;
  final String message;
  final AppMessageType type;
  final String okLabel;
  final VoidCallback? onOk;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      actionsPadding: EdgeInsets.only(bottom: 16, left: 24, right: 24, top: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      iconPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(bottom: 16, left: 24, right: 15, top: 13),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onOk?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              elevation: 0,
            ),
            child: Text(
              okLabel,
              style: AppTypography.style(14, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
      content: Text(message, style: const TextStyle(fontSize: 14, color: Color(0xFF000000))),
      title: Row(
        children: [
          Icon(Icons.info, color: AppColors.orangeFF9100, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title ?? 'Thông báo',
              style: AppTypography.style(16, fontWeight: FontWeight.w700),
            ),
          ),
          IconButton(
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.close, color: AppColors.black, size: 19),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Đóng',
            style: IconButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(7),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}

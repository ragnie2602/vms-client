import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../widgets/monitor_panel.dart';
import 'monitor_alerts.dart';
import 'monitor_cameras.dart';
import 'monitor_mode.dart';

class MonitorActions extends StatefulWidget {
  const MonitorActions({super.key, required this.leftPanelKey, required this.rightPanelKey});
  final GlobalKey<MonitorPanelState> leftPanelKey;
  final GlobalKey<MonitorPanelState> rightPanelKey;

  @override
  State<MonitorActions> createState() => _MonitorActionsState();
}

class _MonitorActionsState extends State<MonitorActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: AppColors.contentBg,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            _actionItem(
              title: 'Danh sách camera',
              icon: AppAssets.icListCamera,
              onTap: () => widget.leftPanelKey.currentState?.togglePanel(
                MonitorCameras(
                  maxWidth: widget.leftPanelKey.currentState?.maxWidth ?? 0,
                  key: ValueKey('monitor_cameras'),
                ),
              ),
            ),
            SizedBox(width: 28),
            _actionItem(
              title: 'Chế độ xem',
              icon: AppAssets.icViewMode,
              suffix: Container(
                decoration: BoxDecoration(
                  color: AppColors.blackOrWhite,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: Text(
                  '3x3',
                  style: AppTypography.style(
                    9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackOrWhiteReverse,
                  ),
                ),
              ),
              onTap: () => widget.leftPanelKey.currentState?.togglePanel(
                MonitorMode(
                  maxWidth: widget.leftPanelKey.currentState?.maxWidth ?? 0,
                  key: ValueKey('monitor_mode'),
                ),
              ),
            ),
            SizedBox(width: 28),
            _actionItem(title: 'Xem toàn màn hình', icon: AppAssets.icTv),

            /*  */
            Spacer(),
            _actionItem(
              title: 'Cảnh báo',
              icon: AppAssets.icAlertTriangle,
              onTap: () => widget.rightPanelKey.currentState?.togglePanel(
                MonitorAlerts(
                  maxWidth: widget.rightPanelKey.currentState?.maxWidth ?? 0,
                  key: ValueKey('monitor_alerts'),
                ),
              ),
              suffix: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFF0004),
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: Text(
                  '09',
                  style: AppTypography.style(
                    9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackOrWhiteReverse,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionItem({
    required String title,
    required String icon,
    bool isSelected = false,
    VoidCallback? onTap,
    Widget? suffix,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.scaffoldBg : null,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 8),
            Text(title, style: AppTypography.style(13, fontWeight: FontWeight.w400)),

            if (suffix != null) ...[SizedBox(width: 8), suffix],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/components/monitor_alerts.dart';

import 'panel.dart';

class ActionItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? suffix;
  const ActionItem({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFEDF3F9) : null,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 8),
            Text(title, style: AppTypography.style(13, fontWeight: FontWeight.w400)),

            if (suffix != null) ...[SizedBox(width: 8), suffix!],
          ],
        ),
      ),
    );
  }

  static Widget alert({
    bool isSelected = false,
    required int id,
    required PanelController controller,
    required Function(int?) onPanelIndexChanged,
    String? count,
  }) => ActionItem(
    isSelected: isSelected,
    title: 'Cảnh báo',
    icon: AppAssets.icAlertTriangle,
    onTap: () => controller.togglePanel(
      MonitorAlerts(maxWidth: controller.expandedWidth, key: ValueKey('monitor_alerts')),
      id: id,
      onPanelIndexChanged: onPanelIndexChanged,
    ),
    suffix: count != null
        ? Container(
            decoration: BoxDecoration(
              color: Color(0xFFFF0004),
              borderRadius: BorderRadius.circular(3),
            ),
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            child: Text(
              count,
              style: AppTypography.style(
                9,
                fontWeight: FontWeight.w600,
                color: AppColors.blackOrWhiteReverse,
              ),
            ),
          )
        : null,
  );
}

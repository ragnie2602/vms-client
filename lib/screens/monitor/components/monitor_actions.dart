import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../bloc/monitor/monitor_bloc.dart';
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
  final ValueNotifier<int?> _leftPanelIndex = ValueNotifier(null);
  final ValueNotifier<int?> _rightPanelIndex = ValueNotifier(null);

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: _leftPanelIndex,
              builder: (context, value, child) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _actionItem(
                    isSelected: value == 0,
                    title: 'Danh sách camera',
                    icon: AppAssets.icListCamera,
                    onTap: () => widget.leftPanelKey.currentState?.togglePanel(
                      MonitorCameras(
                        maxWidth: widget.leftPanelKey.currentState?.maxWidth ?? 0,
                        key: ValueKey('monitor_cameras'),
                      ),
                      id: 0,
                      onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                    ),
                  ),
                  SizedBox(width: 28),
                  _actionItem(
                    isSelected: value == 1,
                    title: 'Chế độ xem',
                    icon: AppAssets.icViewMode,
                    suffix: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blackOrWhite,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      constraints: BoxConstraints(minWidth: 26),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: BlocBuilder<MonitorBloc, MonitorState>(
                        builder: (context, state) {
                          if (state is! MonitorSuccess) return SizedBox();

                          return Text(
                            '${state.mode.rows}x${state.mode.columns}',
                            style: AppTypography.style(
                              9,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackOrWhiteReverse,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                    onTap: () => widget.leftPanelKey.currentState?.togglePanel(
                      MonitorMode(
                        maxWidth: widget.leftPanelKey.currentState?.maxWidth ?? 0,
                        key: ValueKey('monitor_mode'),
                      ),
                      id: 1,
                      onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                    ),
                  ),
                  SizedBox(width: 28),
                  _actionItem(title: 'Xem toàn màn hình', icon: AppAssets.icTv),
                ],
              ),
            ),

            /*  */
            ValueListenableBuilder(
              valueListenable: _rightPanelIndex,
              builder: (context, value, child) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _actionItem(
                    isSelected: value == 0,
                    title: 'Cảnh báo',
                    icon: AppAssets.icAlertTriangle,
                    onTap: () => widget.rightPanelKey.currentState?.togglePanel(
                      MonitorAlerts(
                        maxWidth: widget.rightPanelKey.currentState?.maxWidth ?? 0,
                        key: ValueKey('monitor_alerts'),
                      ),
                      id: 0,
                      onPanelIndexChanged: (index) => _rightPanelIndex.value = index,
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

            if (suffix != null) ...[SizedBox(width: 8), suffix],
          ],
        ),
      ),
    );
  }
}

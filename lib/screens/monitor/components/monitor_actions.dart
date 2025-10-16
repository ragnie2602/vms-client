import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../../shared/action_item.dart';
import '../../shared/panel.dart';
import '../bloc/monitor/monitor_bloc.dart';
import 'monitor_cameras.dart';
import 'monitor_mode.dart';

class MonitorActions extends StatefulWidget {
  const MonitorActions({super.key, required this.leftController, required this.rightController});
  final PanelController leftController;
  final PanelController rightController;

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
                spacing: 28,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionItem(
                    isSelected: value == 0,
                    title: 'Danh sách camera',
                    icon: AppAssets.icListCamera,
                    onTap: () => widget.leftController.togglePanel(
                      MonitorCameras(
                        maxWidth: widget.leftController.expandedWidth,
                        key: ValueKey('monitor_cameras'),
                      ),
                      id: 0,
                      onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                    ),
                  ),
                  ActionItem(
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
                    onTap: () => widget.leftController.togglePanel(
                      MonitorMode(
                        maxWidth: widget.leftController.expandedWidth,
                        key: ValueKey('monitor_mode'),
                      ),
                      id: 1,
                      onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                    ),
                  ),
                  ActionItem(title: 'Xem toàn màn hình', icon: AppAssets.icTv),
                ],
              ),
            ),

            /*  */
            ValueListenableBuilder(
              valueListenable: _rightPanelIndex,
              builder: (context, value, child) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionItem.alert(
                    isSelected: value == 0,
                    id: 0,
                    controller: widget.rightController,
                    onPanelIndexChanged: (index) => _rightPanelIndex.value = index,
                    count: '09',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/monitor/components/monitor_cameras.dart';

import '../../shared/action_item.dart';
import '../../shared/panel.dart';
import '../bloc/camera_live/camera_live_bloc.dart';
import '../widgets/playback_date.dart';
import 'panel_list_playbacks.dart';

class LiveViewActions extends StatefulWidget {
  const LiveViewActions({
    super.key,
    required this.leftController,
    required this.rightController,
    required this.mode,
    this.openCamerasPanelImmediately = false,
  });
  final PanelController leftController;
  final PanelController rightController;
  final LiveViewMode mode;
  final bool openCamerasPanelImmediately;

  @override
  State<LiveViewActions> createState() => _LiveViewActionsState();
}

class _LiveViewActionsState extends State<LiveViewActions> {
  late final ValueNotifier<int?> _leftPanelIndex = ValueNotifier(null);
  late final ValueNotifier<int?> _rightPanelIndex = ValueNotifier(null);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.openCamerasPanelImmediately) {
        widget.leftController.togglePanel(
          MonitorCameras(
            maxWidth: widget.leftController.expandedWidth,
            key: ValueKey('live_view_cameras'),
            selectedCamera: context.read<CameraLiveBloc>().state.camera,
            onTap: (camera) {
              context.read<CameraLiveBloc>().add(ChangeCamera(camera));
            },
          ),
          id: 1,
          onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.contentBg,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
              valueListenable: _leftPanelIndex,
              builder: (context, index, child) => Row(
                spacing: 28,
                children: [
                  if (widget.mode.isPlayback) PlaybackDate(),

                  if (widget.mode.isLive)
                    ActionItem(
                      title: 'Chế độ xem',
                      icon: AppAssets.icViewMode,
                      isSelected: index == 0,
                    ),

                  ActionItem(
                    isSelected: index == 1,
                    title: 'Danh sách camera',
                    icon: AppAssets.icListCamera,
                    onTap: () => widget.leftController.togglePanel(
                      MonitorCameras(
                        maxWidth: widget.leftController.expandedWidth,
                        key: ValueKey('live_view_cameras'),
                        selectedCamera: context.read<CameraLiveBloc>().state.camera,
                        onTap: (camera) {
                          context.read<CameraLiveBloc>().add(ChangeCamera(camera));
                        },
                      ),
                      id: 1,
                      onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                    ),
                  ),
                  if (widget.mode.isPlayback)
                    ActionItem(
                      title: 'Danh sách Playback',
                      icon: AppAssets.icMenu,
                      isSelected: index == 2,
                      onTap: () => widget.leftController.togglePanel(
                        PanelListPlaybacks(
                          maxWidth: widget.leftController.expandedWidth,
                          key: ValueKey('live_view_playbacks'),
                        ),
                        id: 2,
                        onPanelIndexChanged: (index) => _leftPanelIndex.value = index,
                      ),
                    ),
                ],
              ),
            ),

            /*  */
            ValueListenableBuilder(
              valueListenable: _rightPanelIndex,
              builder: (context, index, child) => Row(
                spacing: 28,
                children: [
                  // ActionItem.alert(
                  //   isSelected: index == 0,
                  //   id: 0,
                  //   controller: rightController,
                  //   onPanelIndexChanged: (index) => _rightPanelIndex.value = index,
                  //   count: '09',
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

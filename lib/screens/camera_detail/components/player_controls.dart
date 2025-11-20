import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../widgets/camera_detail_player.dart';
import '../widgets/control_record.dart';
import '../widgets/control_source.dart';
import '../widgets/control_speed_box.dart';
import '../widgets/control_volume.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key, required this.mode});
  final CameraDetailMode mode;

  CameraDetailPlayerState? playerState(BuildContext context) {
    return context.read<CameraDetailBloc>().state.cameraDetailController.ref.currentState;
  }

  Future<void> takeSnapshot(BuildContext context) async {
    final storageFolderState = context.read<StorageFolderBloc>().state;
    final cameraName = context.read<CameraDetailBloc>().state.camera?.name ?? 'camera';

    final data = await playerState(context)?.snapshot();
    if (data == null) return;

    // C:\Users\admin\Documents\VMSLibrary\Snapshots\ten_camera\yyyyMMdd_HHmmss.jpg
    String path = await storageFolderState.ensureSnapshotFolder(
      cameraName,
      '${DateTime.now().format("yyyyMMdd_HHmmss")}.jpg',
    );

    await File(path).writeAsBytes(data);
    ToastUtil.toastSuccess(
      title: Text(
        "Đã chụp hình",
        style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BlocSelector<CameraDetailBloc, CameraDetailState, int>(
        selector: (state) => state.recordingStatus,
        builder: (context, status) {
          final isRecording = status > 0;

          return Row(
            children: <Widget>[
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /* Sources */
                      if (mode.isLive)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ControlSource(disabled: isRecording),
                        ),

                      /* Volumne */
                      ControlVolume(disabled: isRecording),

                      /* Backward */
                      if (mode.isPlayback)
                        _controlItem(disabled: isRecording, AppAssets.icFastBackward, () {
                          context.read<CameraDetailBloc>().add(SeekPlayer(Duration(seconds: -30)));
                        }),

                      /* Pause/Play */
                      BlocSelector<CameraDetailBloc, CameraDetailState, PlayerStatus>(
                        selector: (state) => state.status,
                        builder: (context, status) => _controlItem(
                          disabled: isRecording,
                          status == PlayerStatus.playing ? AppAssets.icPause : AppAssets.icPlay,
                          () => playerState(context)?.togglePlay(),
                        ),
                      ),

                      /* Forward */
                      if (mode.isPlayback)
                        _controlItem(disabled: isRecording, AppAssets.icFastForward, () {
                          context.read<CameraDetailBloc>().add(SeekPlayer(Duration(seconds: 30)));
                        }),

                      /* Record */
                      if (mode.isLive) ControlRecord(recordingStatus: status),

                      /* Camera */
                      _controlItem(
                        disabled: isRecording,
                        AppAssets.icCamera,
                        () => takeSnapshot(context),
                      ),

                      /* Speed */
                      if (mode.isPlayback)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: ControlSpeedBox(disabled: isRecording),
                        ),

                      /* Zoom */
                      _controlItem(
                        disabled: isRecording,
                        AppAssets.icZoomIn,
                        () => playerState(context)?.zoom(1),
                      ),
                      _controlItem(
                        disabled: isRecording,
                        AppAssets.icZoomOut,
                        () => playerState(context)?.zoom(-1),
                      ),

                      /* Fullscreen */
                      _controlItem(
                        disabled: isRecording,
                        AppAssets.icFullscreen,
                        () => playerState(context)?.toggleFullscreen(),
                      ),
                    ],
                  ),
                ),
              ),

              /*  */
              _buildLiveViewMode(
                disabled: isRecording,
                mode.isPlayback ? 1 : 0,
                (index) => context.read<CameraDetailBloc>().add(
                  ChangeViewMode(index == 0 ? CameraDetailMode.live : CameraDetailMode.playback),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _controlItem(String icon, VoidCallback onTap, {bool disabled = false}) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(
          icon,
          width: 28,
          height: 28,
          colorFilter: disabled ? ColorFilter.mode(AppColors.grey64748B, BlendMode.srcIn) : null,
        ),
      ),
    );
  }

  Widget _buildLiveViewMode(int initialIndex, Function(int) onToggle, {bool disabled = false}) {
    return Container(
      height: 60,
      width: 278,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFF2F4FA))),
      ),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(0xFFF2F4FA),
        ),
        child: IgnorePointer(
          ignoring: disabled,
          child: DefaultTabController(
            length: 2,
            initialIndex: initialIndex,
            child: TabBar(
              onTap: onToggle,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.blackOrWhiteReverse,
              ),
              labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              labelColor: disabled ? AppColors.grey64748B : AppColors.blackOrWhite,
              unselectedLabelColor: Color(0xFF64748B),
              labelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
              unselectedLabelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
              tabs: [
                Builder(
                  builder: (context) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icVideoOn,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          IconTheme.of(context).color ?? Colors.transparent,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(padding: const EdgeInsets.only(top: 1), child: Text('Trực tiếp')),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.tabPlayback,
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          IconTheme.of(context).color ?? Colors.transparent,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(padding: const EdgeInsets.only(top: 1), child: Text('Xem lại')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/item_playback_model.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/widgets/empty_record_camera_widget.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

import '../../shared/player/multi_playback_player.dart';

class ItemCameraPlaybackWidget extends StatefulWidget {
  const ItemCameraPlaybackWidget({
    super.key,
    required this.item,
    this.isMultiPlayback = false,
  });
  final ItemPlaybackModel item;
  final bool isMultiPlayback;

  @override
  State<ItemCameraPlaybackWidget> createState() =>
      _ItemCameraPlaybackWidgetState();
}

class _ItemCameraPlaybackWidgetState extends State<ItemCameraPlaybackWidget> {
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isMultiPlayback) {
        widget.item.playerController.changeVolume?.call(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Stack(
        children: [
          (widget.item.listVideoPlaybacks == null)
              ? Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                )
              : (widget.item.isNoVideo)
              ? EmptyRecordCameraWidget()
              : MultiPlaybackPlayer(
                  name: widget.item.camera.name,
                  controller: widget.item.playerController,
                  playlist: widget.item.listVideoPlaybacks ?? [],
                  enableZoom: true,
                  initialVolume: 0,
                  initialDate: widget.item.initialDate,
                  playbackDate: context
                      .read<MultiPlaybackBloc>()
                      .state
                      .playbackDate,
                ),
          // Close button
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                context.read<MultiPlaybackBloc>().add(
                  RemoveCameraEvent(
                    camera: widget.item.camera,
                    indexCam: widget.item.index,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0x99000000),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                child: SvgPicture.asset(
                  AppAssets.icClose,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          // tên cam
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.icVideoOn, width: 16, height: 16),
                  const SizedBox(width: 4),
                  Text(
                    widget.item.camera.name,
                    style: AppTypography.style(
                      9,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Control Bar
          if (_isHovering)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // âm thanh
                    _VolumeControl(controller: widget.item.playerController),
                    // chụp màn hình
                    _buildControlItem(AppAssets.iconCamera, () async {
                      await _takeSnapshot(context);
                    }),
                    // phóng to
                    _buildControlItem(
                      AppAssets.icZoomIn,
                      () => widget.item.playerController.zoom?.call(1),
                    ),
                    // thu nhỏ
                    _buildControlItem(
                      AppAssets.icZoomOut,
                      () => widget.item.playerController.zoom?.call(-1),
                    ),
                    // toàn màn hình
                    _buildControlItem(
                      AppAssets.icFullscreen,
                      () =>
                          widget.item.playerController.toggleFullscreen?.call(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _takeSnapshot(BuildContext context) async {
    final storageFolderState = context.read<StorageFolderBloc>().state;
    final cameraName = widget.item.camera.name;

    String path = await storageFolderState.ensureSnapshotFolder(
      cameraName,
      '${DateTime.now().format("yyyyMMdd_HHmmss")}.jpg',
    );
    final res = await widget.item.playerController.snapshot?.call(path);
    if (res == true) {
      ToastUtil.toastSuccess(
        title: Text(
          "Đã chụp hình",
          style: AppTypography.style(
            14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      );
    }
  }

  Widget _buildControlItem(String icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _VolumeControl extends StatefulWidget {
  const _VolumeControl({required this.controller});

  final PlayerController controller;

  @override
  State<_VolumeControl> createState() => _VolumeControlState();
}

class _VolumeControlState extends State<_VolumeControl> {
  bool _isHovering = false;
  late double _volume;
  late double _preVolume;

  @override
  void initState() {
    super.initState();
    _volume = widget.controller.getVolume?.call() ?? 0;
    _preVolume = _volume > 0 ? _volume : 1;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (_volume > 0) {
                  _preVolume = _volume;
                  _volume = 0;
                } else {
                  _volume = _preVolume;
                }
                widget.controller.changeVolume?.call(_volume);
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                _volume == 0
                    ? AppAssets.icVolumeMuted
                    : _volume < 0.5
                    ? AppAssets.icVolumeHalf
                    : AppAssets.icVolumeFull,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Durations.short4,
            width: _isHovering ? 80 : 0,
            child: _isHovering
                ? SizedBox(
                    width: 80,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                        trackHeight: 2,
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        min: 0,
                        max: 1,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        value: _volume,
                        onChanged: (value) {
                          setState(() => _volume = value);
                          widget.controller.changeVolume?.call(value);
                        },
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}

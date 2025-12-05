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
import 'package:vms_flutter_client/screens/shared/player/playback_player.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

class ItemCameraPlaybackWidget extends StatefulWidget {
  const ItemCameraPlaybackWidget({super.key, required this.item});
  final ItemPlaybackModel item;

  @override
  State<ItemCameraPlaybackWidget> createState() =>
      _ItemCameraPlaybackWidgetState();
}

class _ItemCameraPlaybackWidgetState extends State<ItemCameraPlaybackWidget> {
  bool _isHovering = false;
  bool _isMuted = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Stack(
        children: [
          (widget.item.listVideoPlaybacks ?? []).isEmpty
              ? EmptyRecordCameraWidget()
              : PlaybackPlayer(
                  initialIndex: 0,
                  name: widget.item.camera.name,
                  controller: widget.item.playerController,
                  playlist: widget.item.listVideoPlaybacks ?? [],
                  enableZoom: true,
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
                    _buildControlItem(
                      _isMuted
                          ? AppAssets.icVolumeMuted
                          : AppAssets.icVolumeFull,
                      () {
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                        widget.item.playerController.changeVolume?.call(
                          _isMuted ? 0 : 1,
                        );
                      },
                    ),
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

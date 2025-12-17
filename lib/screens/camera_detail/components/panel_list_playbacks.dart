import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/size_observer.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

import '../../shared/state_builder_mixin.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../widgets/playback_painter.dart';

class PanelListPlaybacks extends StatefulWidget {
  const PanelListPlaybacks({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<PanelListPlaybacks> createState() => _PanelListPlaybacksState();
}

class _PanelListPlaybacksState extends State<PanelListPlaybacks> with StateBuilderMixin {
  late final ScrollController _scrollController = ScrollController();
  double _cardHeight = 36;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _scrollToCurrentIndex();
  }

  void _scrollToCurrentIndex() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients == false ||
          context.read<PlaybackBloc>().state is! PlaybackSuccess) {
        return;
      }

      _scrollController.animateTo(
        // scroll tới vị trí sao cho currentIndex nằm ở giữa màn hình
        (context.read<PlaybackBloc>().state as PlaybackSuccess).currentIndex * _cardHeight,
        duration: Durations.medium1,
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Trường hợp mở tab playback -- chưa chọn camera -- mở tab playback --> infinity loading
    if (context.read<CameraDetailBloc>().state.camera == null) return buildEmpty();

    return BlocBuilder<PlaybackBloc, PlaybackState>(
      buildWhen: (pre, current) {
        final preSelectedIndex = pre is PlaybackSuccess ? pre.currentIndex : null;
        if (current is PlaybackSuccess && current.currentIndex != preSelectedIndex) {
          _scrollToCurrentIndex();
        }

        return true;
      },
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        child: (state) => Material(
          color: Colors.transparent,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: state.playbacks.length,
            itemBuilder: (context, index) {
              final playback = state.playbacks[index];

              return SizeObserver(
                onChange: (size) => _cardHeight = size.height,
                child: InkWell(
                  onTap: () => context
                      .read<CameraDetailBloc>()
                      .state
                      .playerController
                      .jumpToDate
                      ?.call(playback.startTime, dateIndex: index),
                  child: PlaybackItem(
                    maxWidth: widget.maxWidth,
                    playback: playback,
                    backgroundColor: state.currentIndex == index
                        ? AppColors.primary.withValues(alpha: 0.25)
                        : index % 2 == 0
                        ? null
                        : AppColors.greyF2F4FA.withValues(alpha: 0.75),
                    key: ValueKey(playback.playbackId),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PlaybackItem extends StatefulWidget {
  const PlaybackItem({
    super.key,
    required this.playback,
    this.backgroundColor,
    required this.maxWidth,
  });
  final PlaybackVideo playback;
  final Color? backgroundColor;
  final double maxWidth;

  @override
  State<PlaybackItem> createState() => _PlaybackItemState();
}

class _PlaybackItemState extends State<PlaybackItem> {
  late final ValueNotifier<double?> _progress = ValueNotifier(null);

  void _onDownload() {
    if (_progress.value != null) return;

    context.read<PlaybackBloc>().add(
      DownloadPlayback(
        url: widget.playback.urlPlayback,
        getSavedPath: () => context.read<StorageFolderBloc>().state.ensureVideoFolder(
          context.read<CameraDetailBloc>().state.camera?.name ?? 'camera',
          '${widget.playback.startTime.format("yyyyMMdd_HHmmss")}.mp4',
        ),
        onProgress: (progress) => _progress.value = progress,
        onError: (error) {
          _progress.value = null;
          ToastUtil.toastFail(
            context: context,
            title: Text(error ?? 'Có lỗi xảy ra khi tải video'),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: widget.backgroundColor),
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          children: [
            if (constraints.maxWidth > 36)
              CustomPaint(painter: PlaybackPainter(), size: Size(32, 36)),

            /*  */
            if (constraints.maxWidth > 36)
              Expanded(
                child: Text(
                  "${widget.playback.startTime.format('HH:mm:ss')} -> ${widget.playback.endTime.format('HH:mm:ss')}",
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackOrWhite,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
              ),

            /*  */
            if (constraints.maxWidth >= widget.maxWidth - 36 - 16)
              InkWell(
                onTap: _onDownload,
                child: Container(
                  height: 36,
                  width: 36,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: ValueListenableBuilder(
                    valueListenable: _progress,
                    builder: (context, value, child) => value == null
                        ? SvgPicture.asset(AppAssets.icDownload, width: 16, height: 16)
                        : CircularProgressIndicator(
                            padding: const EdgeInsets.all(11),
                            value: value,
                            color: Color(0xFF15ABFF),
                            backgroundColor: Color(0xFFC3D3D9),
                            strokeWidth: 2.5,
                          ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/event/bloc/event_bloc.dart';
import 'package:vms_flutter_client/screens/event/components/event_custom_button.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';
import 'package:vms_flutter_client/screens/shared/custom_table.dart';
import 'package:vms_flutter_client/screens/shared/player/sources.dart';
import 'package:vms_flutter_client/screens/shared/state_builder_mixin.dart';
import 'package:vms_flutter_client/screens/system_configuration/bloc/storage_folder/storage_folder_bloc.dart';

part '../widget/custom_tab_bar.dart';

class EventDetailDialog extends StatefulWidget {
  final int id;

  const EventDetailDialog({super.key, required this.id});

  @override
  State<EventDetailDialog> createState() => _EventDetailDialogState();
}

class _EventDetailDialogState extends State<EventDetailDialog>
    with TickerProviderStateMixin, StateBuilderMixin {
  late final EventBloc eventBloc;
  late final PlaybackBloc playbackBloc;
  late final PlayerController playerController;

  EventEntity? event;

  final TextEditingController descriptionController = TextEditingController();
  late TabController tabController;
  final ValueNotifier<int> _tabIdx = ValueNotifier(0);

  bool imageMode = true;
  DateTime? rewindTime;
  DateTime? endTime;

  final ValueNotifier<PlayerStatus> _playerStatus = ValueNotifier(PlayerStatus.playing);
  final ValueNotifier<double> _volume = ValueNotifier(1.0);
  final ValueNotifier<double> _speed = ValueNotifier(1.0);
  final ValueNotifier<double?> _downloadProgress = ValueNotifier(null);
  DateTime? currentTime;

  @override
  void initState() {
    super.initState();

    eventBloc = context.read()..add(GetEventDetail(eventId: widget.id));

    playbackBloc = context.read();

    playerController = PlayerController()..ref = GlobalKey();
    playerController.onTimeChanged.add(_handleTimeChanged);

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => _tabIdx.value = tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: MediaQuery.heightOf(context) * 624 / 900,
        width: MediaQuery.widthOf(context) * 980 / 1600,
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                children: [
                  Text(
                    'Chi tiết sự kiện',
                    style: AppTypography.style(20, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
            // Content
            BlocConsumer<EventBloc, EventState>(
              buildWhen: (previous, current) =>
                  current is EventDetailSuccess ||
                  current is EventDetailFailure ||
                  current is GettingEventDetail,
              builder: (context, state) {
                if (state is GettingEventDetail) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is EventDetailFailure) return Center(child: Text(state.message));

                if (state is! EventDetailSuccess) return SizedBox.shrink();

                final event = state.event;

                return Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left pane
                      Expanded(
                        flex: 606,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CustomTabBar(controller: tabController),
                              const SizedBox(height: 20),
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: [_imageTab(event), _videoTab(event)],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                spacing: 15,
                                children: [
                                  BlocConsumer<EventBloc, EventState>(
                                    listener: (context, state) {
                                      if (state is SavingImageSuccess) {
                                        ToastUtil.toastSuccess(
                                          title: Text(
                                            'Tải ảnh thành công',
                                            style: AppTypography.style(
                                              14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        );
                                      } else if (state is SavingImageFailure) {
                                        ToastUtil.toastFail(
                                          context: context,
                                          title: Text(state.message),
                                        );
                                      } else if (state is SavingVideoSuccess) {
                                        ToastUtil.toastSuccess(
                                          title: Text(
                                            'Tải video thành công',
                                            style: AppTypography.style(
                                              14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        );
                                      } else if (state is SavingVideoFailure) {
                                        ToastUtil.toastFail(
                                          context: context,
                                          title: Text(state.message),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is SavingImage || state is SavingVideo) {
                                        return SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(strokeWidth: 2),
                                        );
                                      }

                                      return ValueListenableBuilder(
                                        valueListenable: _tabIdx,
                                        builder: (context, value, child) {
                                          return _functionBtn(
                                            icon: SvgPicture.asset(
                                              AppAssets.icDownloadImage,
                                              height: 12,
                                            ),
                                            label: 'Tải ${value == 0 ? 'ảnh' : 'video'}',
                                            onTap: () {
                                              if (value == 0) {
                                                _downloadImage(event);
                                              } else {
                                                _downloadVideo(event);
                                              }
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  _functionBtn(
                                    icon: SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                                    label: 'Xem trực tiếp',
                                    onTap: _live,
                                  ),
                                  _functionBtn(
                                    icon: SvgPicture.asset(AppAssets.icPlayback, height: 20),
                                    label: 'Xem playback',
                                    onTap: _playback,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right pane
                      Expanded(
                        flex: 374,
                        child: Container(
                          decoration: BoxDecoration(color: AppColors.greyAthens),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                event.eventName ?? '',
                                style: AppTypography.style(16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 18),
                              CustomTable(
                                columnSpacing: 10,
                                data: CustomTableData(
                                  columnFlexes: [0, 1, 1],
                                  data: [
                                    [
                                      SvgPicture.asset(AppAssets.icTimeCircle, height: 20),
                                      Text(
                                        'Thời gian',
                                        style: AppTypography.style(13, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        DateFormat('HH:mm dd/MM/yyyy').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            event.timeEvent * 1000,
                                          ),
                                        ),
                                        style: AppTypography.style(14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    [
                                      SvgPicture.asset(AppAssets.icVideoOn, height: 20),
                                      Text(
                                        'Tên camera',
                                        style: AppTypography.style(13, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        event.camera?.name ?? '',
                                        style: AppTypography.style(14, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    ...event.payload?.entries
                                            .map(
                                              (e) => [
                                                SizedBox(width: 20),
                                                Text(
                                                  e.key,
                                                  style: AppTypography.style(
                                                    13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  e.value.toString(),
                                                  style: AppTypography.style(
                                                    14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                            .toList() ??
                                        [],
                                  ],
                                ),
                                defaultVerticalAlignment: CrossAxisAlignment.center,
                                horizontalAlignments: [
                                  CrossAxisAlignment.start,
                                  CrossAxisAlignment.start,
                                  CrossAxisAlignment.end,
                                ],
                                rowSpacing: 18,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Ghi chú:',
                                style: AppTypography.style(14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 18,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.greyE2E8F0),
                                    ),
                                    fillColor: AppColors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(color: AppColors.secondary),
                                    ),
                                    focusColor: AppColors.white,
                                    hintStyle: AppTypography.style(
                                      14,
                                      color: AppColors.grey92929D,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    hintText: 'Nhập nội dung ghi chú',
                                    hoverColor: AppColors.white,
                                  ),
                                  minLines: 3,
                                  maxLines: 100,
                                  textAlignVertical: TextAlignVertical.top,
                                  style: AppTypography.style(14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {
                if (state is EventDetailSuccess) {
                  event = state.event;

                  final eventTime = DateTime.fromMillisecondsSinceEpoch(event!.timeEvent * 1000);
                  currentTime = rewindTime = eventTime.subtract(Duration(seconds: 10));
                  endTime = eventTime.add(Duration(seconds: 10));

                  if (event!.cameraId != null) {
                    playbackBloc.add(GetVideoPlaybacks(event!.cameraId!.codeUnits, rewindTime!));
                  }

                  descriptionController.text = event!.description ?? '';
                }
              },
            ),

            // Footer
            Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.greyF2F4FA, width: 1)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 12,
                children: [
                  EventCustomButton(
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.greyD1D5DB,
                    borderRadius: 5,
                    label: 'Huỷ',
                    onPressed: () => Navigator.pop(context),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle: AppTypography.style(
                      14,
                      color: Color(0xFF374151),
                      lineHeight: 20 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocConsumer<EventBloc, EventState>(
                    builder: (context, state) => state is UpdatingEvent
                        ? const CircularProgressIndicator()
                        : EventCustomButton(
                            backgroundColor: AppColors.secondary,
                            borderColor: AppColors.secondary,
                            borderRadius: 5,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: AppColors.blue3B82F6.withAlpha(51),
                                offset: Offset(0, 2),
                                spreadRadius: -2,
                              ),
                              BoxShadow(
                                blurRadius: 6,
                                color: AppColors.blue3B82F6.withAlpha(51),
                                offset: Offset(0, 4),
                                spreadRadius: -1,
                              ),
                            ],
                            label: 'Lưu',
                            onPressed: () => _save(),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            textStyle: AppTypography.style(
                              14,
                              color: AppColors.white,
                              lineHeight: 20 / 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    listener: (context, state) {
                      if (state is UpdateEventSuccess) {
                        Navigator.pop(context);
                      } else if (state is UpdateEventFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    playbackBloc.close();
    playerController.onTimeChanged.remove(_handleTimeChanged);
    playerController.detach();
    _playerStatus.dispose();
    _volume.dispose();
    _speed.dispose();
    _downloadProgress.dispose();
    super.dispose();
  }

  // Widgets
  Widget _buildControls(bool isFullscreen, PlayerState playerState) {
    if (playerState != PlayerState.initialized) return SizedBox.shrink();

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.contentBg,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              spreadRadius: 2,
              blurRadius: 30,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ValueListenableBuilder<PlayerStatus>(
          valueListenable: _playerStatus,
          builder: (_, status, __) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildVolumeControl(),
              _buildControlButton(
                icon: AppAssets.icFastBackward,
                onTap: () => playerController.seek?.call(Duration(seconds: -3)),
              ),
              _buildControlButton(
                icon: status == PlayerStatus.playing ? AppAssets.icPause : AppAssets.icPlay,
                onTap: () {
                  if (reachEnd) playerController.seek?.call(Duration(seconds: -20));
                  playerController.togglePlay?.call();
                },
              ),
              _buildControlButton(
                icon: AppAssets.icFastForward,
                onTap: () {
                  if (reachEnd) return;
                  playerController.seek?.call(Duration(seconds: 3));
                },
              ),
              _buildSpeedControl(),
              _buildControlButton(
                icon: AppAssets.icZoomIn,
                onTap: () => playerController.zoom?.call(1),
              ),
              _buildControlButton(
                icon: AppAssets.icZoomOut,
                onTap: () => playerController.zoom?.call(-1),
              ),
              _buildControlButton(
                icon: AppAssets.icFullscreen,
                onTap: () => playerController.toggleFullscreen?.call(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlButton({required String icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(icon, width: 28, height: 28),
      ),
    );
  }

  Widget _buildVolumeControl() {
    return ValueListenableBuilder<double>(
      valueListenable: _volume,
      builder: (context, volume, _) {
        return MouseRegion(
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    final newVolume = volume > 0 ? 0.0 : 1.0;
                    _volume.value = newVolume;
                    playerController.changeVolume?.call(newVolume);
                  },
                  child: SvgPicture.asset(
                    volume == 1
                        ? AppAssets.icVolumeFull
                        : volume == 0
                        ? AppAssets.icVolumeMuted
                        : AppAssets.icVolumeHalf,
                    width: 28,
                    height: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpeedControl() {
    return ValueListenableBuilder<double>(
      valueListenable: _speed,
      builder: (context, speed, _) {
        final speedMap = {0.5: "0.5x", 1.0: "1x", 2.0: "2x", 4.0: "4x", 8.0: "8x", 16.0: "16x"};

        return InkWell(
          onTap: () {
            // Cycle through speeds: 1x -> 2x -> 4x -> 8x -> 1x
            final speeds = [1.0, 2.0, 4.0, 8.0];
            final currentIndex = speeds.indexOf(speed);
            final nextSpeed = speeds[(currentIndex + 1) % speeds.length];
            _speed.value = nextSpeed;
            playerController.changeSpeed?.call(nextSpeed);
          },
          borderRadius: BorderRadius.circular(3),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyE2E8F0),
              borderRadius: BorderRadius.circular(3),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              speedMap[speed] ?? "1x",
              style: AppTypography.style(14, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }

  Widget _functionBtn({Widget? icon, String? label, Function()? onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 2,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        shadowColor: Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        side: BorderSide(color: AppColors.greyE5E7EB, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          if (icon != null) icon,
          if (label != null)
            Text(
              label,
              style: AppTypography.style(14, fontWeight: FontWeight.w500, lineHeight: 20 / 14),
            ),
        ],
      ),
    );
  }

  Widget _imageTab(EventEntity event) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(
        event.imageUrl ?? '',
        errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _videoTab(EventEntity event) {
    return BlocConsumer<PlaybackBloc, PlaybackState>(
      buildWhen: (pre, cur) {
        if (pre is PlaybackSuccess && cur is PlaybackSuccess) {
          return pre.playbacks != cur.playbacks || pre.initialIndex != cur.initialIndex;
        }
        return true;
      },
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        onReload: () {
          if (event.camera?.id != null && rewindTime != null) {
            context.read<PlaybackBloc>().add(GetVideoPlaybacks(event.camera!.id, rewindTime!));
          }
        },
        child: (state) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.black),
          clipBehavior: Clip.antiAlias,
          child: PlaybackPlayer(
            enableZoom: true,
            playlist: state.playbacks.toList(),
            name: event.camera?.name ?? '',
            initialIndex: state.initialIndex,
            controller: playerController,
            onStatusChanged: (status) {
              _playerStatus.value = status;
            },
            onInitializedValues: ({required double volume, required double speed}) {
              _volume.value = volume;
              _speed.value = speed;
            },
            controlsBuilder: (fullscreen, playerState) =>
                fullscreen ? Container() : _buildControls(fullscreen, playerState),
          ),
        ),
      ),
      listener: (context, state) {
        if (rewindTime != null && state is PlaybackSuccess) {
          final rewindTimeCopy = rewindTime!;
          final idx = state.playbacks.indexWhere(
            (e) => e.startTime.isBefore(rewindTimeCopy) && e.endTime.isAfter(rewindTimeCopy),
          );
          if (idx != -1) {
            context.read<PlaybackBloc>().add(ChangePlayback(idx));

            playerController.waitForAttached.future.then((_) {
              playerController.jumpToDate?.call(rewindTimeCopy, dateIndex: idx);
            });
          }
          rewindTime = null;
        }
      },
    );
  }

  // _Functions
  bool get reachEnd => currentTime?.isAfter(endTime!) ?? false;

  void _downloadImage(EventEntity event) async {
    final imageUrl = event.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      ToastUtil.toastFail(context: context, title: Text('Không tìm thấy ảnh để tải xuống'));
      return;
    }

    String ext = '.jpg';
    final lowerUrl = imageUrl.toLowerCase();
    if (lowerUrl.endsWith('.png')) {
      ext = '.png';
    } else if (lowerUrl.endsWith('.jpeg')) {
      ext = '.jpg';
    }

    final eventTime = DateTime.fromMillisecondsSinceEpoch(event.timeEvent * 1000);
    final eventName = event.eventName?.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_') ?? 'event';
    final timeStr = eventTime.format("yyyyMMdd_HHmmss");
    final fileName = '${eventName}_$timeStr$ext';

    final path = await context.read<StorageFolderBloc>().state.ensureSnapshotFolder(
      event.camera?.name ?? 'camera',
      fileName,
    );

    if (mounted) context.read<EventBloc>().add(SaveImage(event, path));
  }

  void _downloadVideo(EventEntity event) async {
    final playbackState = playbackBloc.state;
    if (playbackState is! PlaybackSuccess || playbackState.playbacks.isEmpty) {
      ToastUtil.toastFail(context: context, title: Text('Không tìm thấy video playback'));
      return;
    }

    final eventTime = DateTime.fromMillisecondsSinceEpoch(event.timeEvent * 1000);
    final targetPlayback = playbackState.playbacks.firstWhere(
      (p) => p.startTime.isBefore(eventTime) && p.endTime.isAfter(eventTime),
      orElse: () => playbackState.playbacks[playbackState.currentIndex],
    );

    final eventName = event.eventName?.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_') ?? 'event';
    final timeStr = eventTime.format("yyyyMMdd_HHmmss");
    final fileName = 'Video_${eventName}_$timeStr.mp4';

    final path = await context.read<StorageFolderBloc>().state.ensureVideoFolder(
      event.camera?.name ?? 'camera',
      fileName,
    );

    if (mounted) context.read<EventBloc>().add(SaveVideo(targetPlayback.urlPlayback, path));
  }

  void _handleTimeChanged(DateTime currentTime, [bool isUserSeeking = false]) {
    this.currentTime = currentTime;
    if (endTime != null && currentTime.isAfter(endTime!)) {
      playerController.pause?.call();
    }
  }

  _live() {
    if (event == null) return;

    Navigator.pop(context);

    context.read<HomeBloc>().add(
      ChangeTab(
        HomeTab.tabs[1],
        route: Routes.cameraDetail,
        extra: CameraDetailScreenArgs(data: event!.camera),
      ),
    );
  }

  _playback() {
    if (event == null) return;

    Navigator.pop(context);

    context.read<HomeBloc>().add(
      ChangeTab(
        HomeTab.tabs[1],
        route: Routes.cameraDetail,
        extra: CameraDetailScreenArgs(
          data: event!.camera,
          isPlayback: true,
          rewind: DateTime.fromMillisecondsSinceEpoch(event!.timeEvent * 1000),
          title: 'Xem lại',
          key: UniqueKey(),
        ),
      ),
    );
  }

  _save() {
    context.read<EventBloc>().add(
      UpdateEvent(eventId: widget.id, description: descriptionController.text),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/toast_util.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/camera_detail/camera_detail_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/bloc/playback/playback_bloc.dart';
import 'package:vms_flutter_client/screens/camera_detail/camera_detail_screen.dart';
import 'package:vms_flutter_client/screens/camera_detail/layout/camera_detail_mobile_layout.dart';
import 'package:vms_flutter_client/screens/shared/player/monitor_player.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';

class MobileCameraDetailScreen extends StatefulWidget {
  final CameraDetailScreenArgs args;

  const MobileCameraDetailScreen({super.key, required this.args});

  @override
  State<MobileCameraDetailScreen> createState() => _MobileCameraDetailScreenState();
}

class _MobileCameraDetailScreenState extends State<MobileCameraDetailScreen> {
  late final CameraDetailBloc bloc;

  ValueNotifier<bool> isMuted = ValueNotifier(false);
  ValueNotifier<bool> isPlaying = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    bloc = CameraDetailBloc(
      mode: widget.args.isPlayback ? CameraDetailMode.playback : CameraDetailMode.live,
      camera: widget.args.data,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Widget _buildPlayback() {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider(
          lazy: false,
          create: (_) =>
              PlaybackBloc(context.read(), context.read())
                ..add(GetVideoPlaybacks(bloc.state.camera!.id, bloc.state.playbackDate)),
        ),
      ],
      child: BlocConsumer<CameraDetailBloc, CameraDetailState>(
        listenWhen: (previous, current) {
          return previous.camera?.id != current.camera?.id ||
              previous.playbackDate != current.playbackDate;
        },
        listener: (context, state) {
          if (state.camera == null) return;
          context.read<PlaybackBloc>().add(GetVideoPlaybacks(state.camera!.id, state.playbackDate));
        },
        buildWhen: (previous, current) {
          return previous.camera?.id != current.camera?.id ||
              previous.mode != current.mode ||
              previous.stream != current.stream;
        },
        builder: (context, state) => CameraDetailMobileLayout(mode: CameraDetailMode.playback),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.args.isPlayback) return _buildPlayback();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final path = await thumbnail();

        if (context.mounted) context.pop(path);
      },
      child: BlocProvider.value(
        value: bloc,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: IconButton(
              onPressed: () async {
                final path = await thumbnail();

                // ignore: use_build_context_synchronously
                context.pop(path);
              },
              icon: Icon(Icons.chevron_left),
            ),
            scrolledUnderElevation: 0,
            title: Text(
              '${widget.args.data?.name}',
              style: AppTypography.style(15, fontWeight: FontWeight.w600),
            ),
            titleSpacing: 0,
          ),
          body: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: BlocBuilder<CameraDetailBloc, CameraDetailState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return MonitorPlayer(
                      syncSystemVolume: true,
                      onVolumeChanged: (volume) {
                        isMuted.value = volume <= 0;
                      },
                      enableZoom: true,
                      mode: MonitorMode.liveview,
                      source: state.stream?.urlOfStream ?? state.camera!.mainStreamUri.toString(),
                      name: state.camera!.name,
                      controller: state.playerController,
                      onStatusChanged: (status) {
                        context.read<CameraDetailBloc>().add(ChangePlayerStatus(status));
                      },
                      onInitializedValues: ({required double volume, required double speed}) {
                        isMuted.value = volume <= 0;
                        context.read<CameraDetailBloc>().add(ChangeVolume(volume));
                        context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
                        context.read<CameraDetailBloc>().add(OnRecording(cancelStatus: 0));
                      },
                      onLostConnection: () {
                        final bloc = context.read<CameraDetailBloc>();
                        if (bloc.state.recordingStatus != 0) {
                          bloc.add(OnRecording(cancelStatus: -1));
                        }
                      },
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: togglePlay,
                      icon: ValueListenableBuilder(
                        valueListenable: isPlaying,
                        builder: (context, value, child) {
                          return SvgPicture.asset(
                            value ? AppAssets.icPauseMobile : AppAssets.icPlayMobile,
                          );
                        },
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () => screenshot(),
                      icon: SvgPicture.asset(AppAssets.icCamera01),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: toggleMute,
                      icon: ValueListenableBuilder(
                        valueListenable: isMuted,
                        builder: (context, value, child) {
                          return SvgPicture.asset(
                            value ? AppAssets.icVolumeMuted : AppAssets.icVolume,
                          );
                        },
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: fullscreen,
                      icon: SvgPicture.asset(AppAssets.icFullAltRight),
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: AppColors.greyE5E5E5, height: 1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    bloc.close();
    super.dispose();
  }

  void fullscreen() {
    bloc.state.playerController.toggleFullscreen?.call();
  }

  screenshot() async {
    String path = '';
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (Platform.isIOS) {
      path = '${(await getLibraryDirectory()).path}/${widget.args.data?.camId}_$currentTime.jpg';
    } else if (Platform.isAndroid) {
      path =
          '${(await getExternalStorageDirectory())?.path}/../../../../Pictures/VMS/${widget.args.data?.camId}_$currentTime.jpg';
    }

    bool? isSuccess = false;
    if (path.isNotEmpty) isSuccess = await bloc.state.playerController.snapshot?.call(path);

    if (isSuccess == true) {
      ToastUtil.toastSuccess(
        // ignore: use_build_context_synchronously
        context: context,
        title: Text(
          'Ảnh chụp thành công!',
          style: AppTypography.style(10, color: AppColors.white, fontWeight: FontWeight.w400),
        ),
      );
    } else {
      ToastUtil.toastFail(
        // ignore: use_build_context_synchronously
        context: context,
        title: Text(
          'Có lỗi xảy ra!',
          style: AppTypography.style(10, color: AppColors.white, fontWeight: FontWeight.w400),
        ),
      );
    }
  }

  Future<String?> thumbnail() async {
    final path = '${(await getTemporaryDirectory()).path}/${widget.args.data?.camId}';
    await bloc.state.playerController.snapshot?.call(path);

    return path;
  }

  void toggleMute() {
    bloc.state.playerController.changeVolume?.call(isMuted.value ? 100 : 0);
    isMuted.value = !isMuted.value;
  }

  void togglePlay() {
    bloc.state.playerController.togglePlay?.call();
    isPlaying.value = !isPlaying.value;
  }
}

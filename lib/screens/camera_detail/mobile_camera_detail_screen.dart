import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gal/gal.dart';
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

import 'components/mobile_controls_overlay.dart';

class MobileCameraDetailScreen extends StatefulWidget {
  final CameraDetailScreenArgs args;

  const MobileCameraDetailScreen({super.key, required this.args});

  @override
  State<MobileCameraDetailScreen> createState() => _MobileCameraDetailScreenState();
}

class _MobileCameraDetailScreenState extends State<MobileCameraDetailScreen> {
  late final CameraDetailBloc bloc;

  ValueNotifier<bool> isMuted = ValueNotifier(false);

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
              onPressed: () => Navigator.of(context).maybePop(),
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
                      controlsBuilder: (isFullscreen) => MobileControlsOverlay(
                        name: widget.args.data?.name ?? '',
                        isFullscreen: isFullscreen,
                        mode: CameraDetailMode.live,
                        detailBloc: bloc,
                        initialVisible: bloc.state.status == PlayerStatus.paused,
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: BlocSelector<CameraDetailBloc, CameraDetailState, PlayerStatus>(
                        selector: (state) => state.status,
                        builder: (context, status) => SvgPicture.asset(
                          status == PlayerStatus.playing
                              ? AppAssets.icPauseMobile
                              : AppAssets.icPlayMobile,
                        ),
                      ),
                      onPressed: widget.args.data?.isOnline == true
                          ? () => bloc.state.playerController.togglePlay?.call()
                          : null,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: SvgPicture.asset(AppAssets.icCamera01),
                      onPressed: widget.args.data?.isOnline == true ? () => screenshot() : null,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: ValueListenableBuilder(
                        valueListenable: isMuted,
                        builder: (context, value, child) {
                          return SvgPicture.asset(
                            value ? AppAssets.icVolumeMuted : AppAssets.icVolume,
                          );
                        },
                      ),
                      onPressed: widget.args.data?.isOnline == true ? toggleMute : null,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: SvgPicture.asset(AppAssets.icFullAltRight),
                      onPressed: widget.args.data?.isOnline == true ? fullscreen : null,
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
    bloc.add(
      TakeSnapshot(
        onSuccess: () => ToastUtil.toastSuccess(
        title: Text(
            "Đã lưu ảnh chụp",
            style: AppTypography.style(14, fontWeight: FontWeight.w500, color: AppColors.white),
          ),
        ),
      ),
    );
  }

  Future<String?> thumbnail() async {
    if (bloc.state.playerController.isInitialized?.call() != true) return null;

    final path = '${(await getTemporaryDirectory()).path}/${widget.args.data?.camId}';
    await bloc.state.playerController.captureThumbnail?.call(path);

    return path;
  }

  void toggleMute() {
    bloc.state.playerController.changeVolume?.call(isMuted.value ? 100 : 0);
    isMuted.value = !isMuted.value;
  }
}

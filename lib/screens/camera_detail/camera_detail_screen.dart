import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

import '../shared/state_builder_mixin.dart';
import 'bloc/camera_detail/camera_detail_bloc.dart';
import 'bloc/playback/playback_bloc.dart';
import 'layout/camera_detail_desktop_layout.dart';
import 'widgets/camera_detail_player.dart';

class CameraDetailScreenArgs extends BaseScreenArgs {
  final CameraEntity? data;
  final bool isPlayback;
  final bool openCamerasPanelImmediately;
  final Key? key;

  CameraDetailScreenArgs({
    required this.data,
    this.isPlayback = false,
    this.openCamerasPanelImmediately = false,
    this.key,
    super.onBack,
    String? title,
    super.description,
  }) : super(title: title ?? data?.name);
}

class CameraDetailScreen extends StatelessWidget with StateBuilderMixin {
  CameraDetailScreen({required CameraDetailScreenArgs args})
    : data = args.data,
      isPlayback = args.isPlayback,
      openCamerasPanelImmediately = args.openCamerasPanelImmediately,
      super(key: args.key);

  final CameraEntity? data;
  final bool isPlayback;
  final bool openCamerasPanelImmediately;

  void _handlePageInfo(BuildContext context, CameraDetailState pre, CameraDetailState cur) {
    if ((pre.mode != cur.mode || pre.camera != cur.camera) && cur.camera != null) {
      context.read<HomeBloc>().add(
        ChangePageInfo(
          title: "${cur.mode == CameraDetailMode.playback ? 'Xem lại' : ''} ${cur.camera!.name}",
          onBack: context.read<HomeBloc>().state.onBack,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CameraDetailBloc(
            mode: isPlayback ? CameraDetailMode.playback : CameraDetailMode.live,
            camera: data,
          ),
          lazy: false,
        ),
        BlocProvider(create: (_) => PlaybackBloc(context.read(), context.read())),
      ],
      child: BlocConsumer<CameraDetailBloc, CameraDetailState>(
        listenWhen: (previous, current) {
          _handlePageInfo(context, previous, current);
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
        builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CameraDetailDesktopLayout(
              openCamerasPanelImmediately: openCamerasPanelImmediately || isPlayback,
              content: state.camera == null
                  ? null
                  : state.mode.isPlayback
                  ? _waitingPlayback(state, context)
                  : _buildLiveview(state, context),
              mode: state.mode,
            ),
          );
        },
      ),
    );
  }

  Widget _waitingPlayback(CameraDetailState data, BuildContext context) {
    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        onReload: () => context.read<PlaybackBloc>().add(
          GetVideoPlaybacks(data.camera!.id, context.read<CameraDetailBloc>().state.playbackDate),
        ),
        child: (state) => CameraDetailPlayer.playlist(
          playlist: state.playbacks.toList(),
          name: data.camera!.name,
          initialIndex: state.initialIndex,
          controller: data.cameraDetailController,
          onStatusChanged: (status) {
            context.read<CameraDetailBloc>().add(ChangePlayerStatus(status));
          },
          onInitializedValues: ({required double volume, required double speed}) {
            context.read<CameraDetailBloc>().add(ChangeVolume(volume));
            context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
            context.read<CameraDetailBloc>().add(OnRecording(cancelStatus: 0));
          },
        ),
      ),
    );
  }

  Widget _buildLiveview(CameraDetailState state, BuildContext context) {
    return CameraDetailPlayer.liveview(
      source: state.stream?.urlOfStream ?? state.camera!.mainStreamUri.toString(),
      name: state.camera!.name,
      controller: state.cameraDetailController,
      onStatusChanged: (status) {
        context.read<CameraDetailBloc>().add(ChangePlayerStatus(status));
      },
      onInitializedValues: ({required double volume, required double speed}) {
        context.read<CameraDetailBloc>().add(ChangeVolume(volume));
        context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
        context.read<CameraDetailBloc>().add(OnRecording(cancelStatus: 0));
      },
      onLostConnection: () {
        final bloc = context.read<CameraDetailBloc>();
        if (bloc.state.recordingStatus != 0) bloc.add(OnRecording(cancelStatus: -1));
      },
    );
  }
}

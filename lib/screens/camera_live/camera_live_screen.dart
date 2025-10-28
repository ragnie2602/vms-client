import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

import '../shared/state_builder_mixin.dart';
import 'bloc/camera_live/camera_live_bloc.dart';
import 'bloc/playback/playback_bloc.dart';
import 'layout/camera_live_desktop_layout.dart';
import 'widgets/camera_live_player.dart';

class CameraLiveScreenArgs extends BaseScreenArgs {
  final CameraEntity? data;
  final bool isPlayback;

  CameraLiveScreenArgs({
    required this.data,
    this.isPlayback = false,
    super.onBack,
    String? title,
    super.description,
  }) : super(title: title ?? data?.name);
}

class CameraLiveScreen extends StatelessWidget with StateBuilderMixin {
  CameraLiveScreen({super.key, required CameraLiveScreenArgs args})
    : data = args.data,
      isPlayback = args.isPlayback;

  final CameraEntity? data;
  final bool isPlayback;

  void _handlePageInfo(BuildContext context, CameraLiveState pre, CameraLiveState cur) {
    if ((pre.mode != cur.mode || pre.camera != cur.camera) && cur.camera != null) {
      context.read<HomeBloc>().add(
        ChangePageInfo(
          title: "${cur.mode == LiveViewMode.playback ? 'Playback' : ''} ${cur.camera!.name}",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CameraLiveBloc(
            mode: isPlayback ? LiveViewMode.playback : LiveViewMode.live,
            camera: data,
          ),
          lazy: false,
        ),
        BlocProvider(create: (_) => PlaybackBloc(context.read(), context.read())),
      ],
      child: BlocConsumer<CameraLiveBloc, CameraLiveState>(
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
          return previous.camera?.id != current.camera?.id || previous.mode != current.mode;
        },
        builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CameraLiveDesktopLayout(
              openCamerasPanelImmediately: isPlayback,
              content: state.camera == null
                  ? null
                  : state.mode.isPlayback
                  ? _waitingPlayback(state, context)
                  : _buildPlayer(state, context),
              mode: state.mode,
            ),
          );
        },
      ),
    );
  }

  Widget _waitingPlayback(CameraLiveState data, BuildContext context) {
    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        onReload: () => context.read<PlaybackBloc>().add(
          GetVideoPlaybacks(data.camera!.id, context.read<CameraLiveBloc>().state.playbackDate),
        ),
        child: (state) => CameraLivePlayer.playlist(
          playlist: state.playbacks.toList(),
          name: data.camera!.name,
          initialIndex: state.initialIndex,
          controller: data.cameraLiveController,
          onStatusChanged: (status) {
            context.read<CameraLiveBloc>().add(ChangePlayerStatus(status));
          },
        ),
      ),
    );
  }

  Widget _buildPlayer(CameraLiveState state, BuildContext context) {
    return CameraLivePlayer.liveview(
      source: state.camera!.mainStreamUri.toString(),
      name: state.camera!.name,
      controller: state.cameraLiveController,
      onStatusChanged: (status) {
        context.read<CameraLiveBloc>().add(ChangePlayerStatus(status));
      },
    );
  }
}

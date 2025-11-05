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

  CameraDetailScreenArgs({
    required this.data,
    this.isPlayback = false,
    super.onBack,
    String? title,
    super.description,
  }) : super(title: title ?? data?.name);
}

class CameraDetailScreen extends StatelessWidget with StateBuilderMixin {
  CameraDetailScreen({super.key, required CameraDetailScreenArgs args})
    : data = args.data,
      isPlayback = args.isPlayback;

  final CameraEntity? data;
  final bool isPlayback;

  void _handlePageInfo(BuildContext context, CameraDetailState pre, CameraDetailState cur) {
    if ((pre.mode != cur.mode || pre.camera != cur.camera) && cur.camera != null) {
      context.read<HomeBloc>().add(
        ChangePageInfo(
          title: "${cur.mode == CameraDetailMode.playback ? 'Playback' : ''} ${cur.camera!.name}",
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
          return previous.camera?.id != current.camera?.id || previous.mode != current.mode;
        },
        builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CameraDetailDesktopLayout(
              openCamerasPanelImmediately: true,
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
            context.read<CameraDetailBloc>().add(ChangeRecordingStatus(false));
          },
        ),
      ),
    );
  }

  Widget _buildPlayer(CameraDetailState state, BuildContext context) {
    return CameraDetailPlayer.liveview(
      source: state.camera!.mainStreamUri.toString(),
      name: state.camera!.name,
      controller: state.cameraDetailController,
      onStatusChanged: (status) {
        context.read<CameraDetailBloc>().add(ChangePlayerStatus(status));
      },
      onInitializedValues: ({required double volume, required double speed}) {
        context.read<CameraDetailBloc>().add(ChangeVolume(volume));
        context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
        context.read<CameraDetailBloc>().add(ChangeRecordingStatus(false));
      },
    );
  }
}

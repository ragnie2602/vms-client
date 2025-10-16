import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../monitor/widgets/camera_player.dart';
import '../shared/state_builder_mixin.dart';
import 'bloc/camera_live/camera_live_bloc.dart';
import 'bloc/playback/playback_bloc.dart';
import 'layout/camera_live_desktop_layout.dart';

class CameraLiveScreenArgs extends BaseScreenArgs {
  final CameraEntity data;
  final bool isPlayback;

  CameraLiveScreenArgs({
    required this.data,
    this.isPlayback = false,
    super.onBack,
    String? title,
    super.description,
  }) : super(title: title ?? data.name);
}

class CameraLiveScreen extends StatelessWidget with StateBuilderMixin {
  CameraLiveScreen({super.key, required CameraLiveScreenArgs args})
    : data = args.data,
      isPlayback = args.isPlayback;

  final CameraEntity data;
  final bool isPlayback;

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
        BlocProvider(create: (_) => PlaybackBloc(context.read())),
      ],
      child: BlocBuilder<CameraLiveBloc, CameraLiveState>(
        buildWhen: (previous, current) =>
            previous.camera.id != current.camera.id || previous.mode != current.mode,
        builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CameraLiveDesktopLayout(
              content: state.mode.isPlayback
                  ? _waitingPlayback(state, context)
                  : _buildPlayer(state),
              mode: state.mode,
            ),
          );
        },
      ),
    );
  }

  Widget _waitingPlayback(CameraLiveState data, BuildContext context) {
    context.read<PlaybackBloc>().add(GetVideoPlaybacks(data.camera.id));

    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        onReload: () => context.read<PlaybackBloc>().add(GetVideoPlaybacks(data.camera.id)),
        child: (state) => _buildPlayer(data, overrideSource: state.playbacks.first.urlPlayback),
      ),
    );
  }

  Widget _buildPlayer(CameraLiveState state, {String? overrideSource}) {
    return CameraPlayer(
      key: state.ref,
      source: overrideSource ?? state.camera.mainStreamUri.toString(),
      name: state.camera.name,
      mode: overrideSource == null ? PlayerMode.livestreaming : PlayerMode.playback,
      builder: (context, playerWidget) => Stack(
        fit: StackFit.expand,
        children: [
          playerWidget,
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.white.withValues(alpha: 0.6))],
              ),
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.icVideoOn, width: 20, height: 20),
                  SizedBox(width: 4),
                  Text(
                    data.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

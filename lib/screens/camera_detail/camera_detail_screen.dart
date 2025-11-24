import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/osd_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/home/bloc/home_bloc.dart';

import '../shared/player/sources.dart';
import '../shared/state_builder_mixin.dart';
import 'bloc/camera_detail/camera_detail_bloc.dart';
import 'bloc/playback/playback_bloc.dart';
import 'layout/camera_detail_desktop_layout.dart';

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
  final OSDPosition _position = OsdUtil.getOSDPositions();

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
        child: (state) => PlaybackPlayer(
          enableZoom: true,
          playlist: state.playbacks.toList(),
          name: data.camera!.name,
          initialIndex: state.initialIndex,
          controller: data.playerController,
          labelBuilder: _buildLabel,
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
    return MonitorPlayer(
      enableZoom: true,
      mode: MonitorMode.liveview,
      source: state.stream?.urlOfStream ?? state.camera!.mainStreamUri.toString(),
      name: state.camera!.name,
      controller: state.playerController,
      labelBuilder: _buildLabel,
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

  Widget _buildLabel(String name) {
    return Positioned(
      bottom: (_position.value & 1) == 1 ? 20 : null,
      left: (_position.value & 2) == 0 ? 20 : null,
      right: (_position.value & 2) == 2 ? 20 : null,
      top: (_position.value & 1) == 0 ? 20 : null,
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
              name,
              style: AppTypography.style(11, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

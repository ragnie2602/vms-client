import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/shared/player/player_controller.dart';

import '../../shared/player/playback_player.dart';
import '../../shared/state_builder_mixin.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../components/mobile_controls_overlay.dart';
import '../components/mobile_list_playbacks.dart';
import '../components/mobile_player_controls.dart';
import '../components/mobile_player_timeline.dart';

class CameraDetailMobileLayout extends StatelessWidget with StateBuilderMixin {
  const CameraDetailMobileLayout({super.key, required this.mode});
  final CameraDetailMode mode;

  CameraDetailBloc _detailBloc(BuildContext context) => context.read<CameraDetailBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => context.goNamed(Routes.monitoring.name),
          icon: Icon(Icons.chevron_left),
        ),
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: Text(
          context.read<CameraDetailBloc>().state.camera!.name,
          style: AppTypography.style(15, fontWeight: FontWeight.w600),
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: mode.isPlayback ? _buildPlayback(context) : Container(),
            ),

            /*  */
            MobilePlayerControls(),

            /*  */
            if (mode.isPlayback) ...[
              MobilePlayerTimeline(
                size: Size(double.infinity, 64),
                timeStyle: const TextStyle(
                  color: AppColors.grey666666,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                playbackColor: AppColors.blue005AA9,
                unplaybackColor: AppColors.greyCACACA,
                centralLineColor: AppColors.blue15ABFF,
                tickColor: AppColors.greyE5E5E5,
              ),
              Expanded(child: MobileListPlaybacks()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPlayback(BuildContext context) {
    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        loadingBuilder: () => Container(
          color: Colors.black,
          child: Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white)),
        ),
        child: (state) => PlaybackPlayer(
          syncSystemVolume: true,
          enableZoom: true,
          playlist: state.playbacks.toList(),
          name: _detailBloc(context).state.camera!.name,
          initialIndex: state.initialIndex,
          controller: _detailBloc(context).state.playerController,
          onStatusChanged: (status) {
            _detailBloc(context).add(ChangePlayerStatus(status));
          },
          onVolumeChanged: (volume) {
            _detailBloc(context).add(ChangeVolume(volume));
          },
          onInitializedValues: ({required double volume, required double speed}) {
            _detailBloc(context)
              ..add(ChangeVolume(volume))
              ..add(ChangeSpeed(speed))
              ..add(OnRecording(cancelStatus: 0));
          },
          controlsBuilder: (isFullscreen) => MobileControlsOverlay(
            name: _detailBloc(context).state.camera!.name,
            isFullscreen: isFullscreen,
            mode: CameraDetailMode.playback,
            detailBloc: _detailBloc(context),
            initialVisible: _detailBloc(context).state.status == PlayerStatus.paused,
            bottomBuilder: () => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<PlaybackBloc>()),
                BlocProvider.value(value: _detailBloc(context)),
              ],
              child: MobilePlayerTimeline(
                backgroundColor: AppColors.greyF2F2F2.withValues(alpha: 0.8),
                initialTime: _detailBloc(context).state.playerController.playerTime?.call(),
                size: Size(double.infinity, 64),
                timeStyle: const TextStyle(
                  color: AppColors.grey666666,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                playbackColor: AppColors.blue005AA9,
                unplaybackColor: AppColors.greyCACACA,
                centralLineColor: AppColors.blue15ABFF,
                tickColor: AppColors.greyE5E5E5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

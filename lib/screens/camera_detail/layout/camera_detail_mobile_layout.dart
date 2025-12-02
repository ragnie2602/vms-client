import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vms_flutter_client/core/app_router.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/camera_detail/components/player_timeline.dart';

import '../../shared/player/playback_player.dart';
import '../../shared/state_builder_mixin.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../components/mobile_list_playbacks.dart';
import '../components/mobile_player_controls.dart';

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
              PlayerTimeline(
                size: Size(double.infinity, 64),
                normalStyle: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                ),
                highlightStyle: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                ),
                playbackColor: Color.fromRGBO(21, 171, 255, 0.4),
                centralLineColor: Color.fromRGBO(33, 204, 195, 1),
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
        ),
      ),
    );
  }
}

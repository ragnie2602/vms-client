import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/app_bloc.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/screens/playback/widgets/multi_control_speed_box.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';
import 'package:vms_flutter_client/screens/shared/player/components/fullscreen_portal.dart';

class MultiPlayerControls extends StatelessWidget {
  const MultiPlayerControls({super.key});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.contentBg,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Backward */
                  _controlItem(AppAssets.icFastBackward, () {
                    context.read<MultiPlaybackBloc>().add(
                      MultiSeekEvent(Duration(seconds: -30)),
                    );
                  }),

                  /* Pause/Play */
                  BlocSelector<MultiPlaybackBloc, MultiPlaybackState, bool>(
                    selector: (state) => state.isPlaying,
                    builder: (context, isPlaying) => _controlItem(
                      isPlaying ? AppAssets.icPause : AppAssets.icPlay,
                      () => context.read<MultiPlaybackBloc>().add(
                        MultiTogglePlayEvent(),
                      ),
                    ),
                  ),

                  /* Forward */
                  _controlItem(AppAssets.icFastForward, () {
                    context.read<MultiPlaybackBloc>().add(
                      MultiSeekEvent(Duration(seconds: 30)),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: MultiControlSpeedBox(disabled: false),
                  ),
                  /* Fullscreen */
                  _controlItem(AppAssets.icFullscreen, () {
                    context.read<AppBloc>().add(ToggleMonitorDisplayMode());
                    defaultEnterNativeFullscreen();
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlItem(
    String icon,
    VoidCallback onTap, {
    bool disabled = false,
  }) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(
          icon,
          width: 28,
          height: 28,
          colorFilter: disabled
              ? ColorFilter.mode(AppColors.grey64748B, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}

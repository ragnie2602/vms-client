import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../widgets/camera_detail_player.dart';
import '../widgets/volume_with_slide.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key, required this.mode});
  final CameraDetailMode mode;

  CameraDetailPlayerState? playerState(BuildContext context) {
    return context.read<CameraDetailBloc>().state.cameraDetailController.ref.currentState;
  }

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
                  /* Volumne */
                  VolumeWithSlide(),

                  /* Backward */
                  if (mode.isPlayback)
                    _controlItem(AppAssets.icFastBackward, () {
                      context.read<CameraDetailBloc>().add(SeekPlayer(Duration(seconds: -30)));
                    }),

                  /* Pause/Play */
                  BlocSelector<CameraDetailBloc, CameraDetailState, PlayerStatus>(
                    selector: (state) => state.status,
                    builder: (context, status) => _controlItem(
                      status == PlayerStatus.playing ? AppAssets.icPause : AppAssets.icPlay,
                      () => playerState(context)?.togglePlay(),
                    ),
                  ),

                  /* Forward */
                  if (mode.isPlayback)
                    _controlItem(AppAssets.icFastForward, () {
                      context.read<CameraDetailBloc>().add(SeekPlayer(Duration(seconds: 30)));
                    }),

                  /* Record */
                  // _controlItem(AppAssets.icRecord, () {}),

                  /* Camera */
                  _controlItem(AppAssets.icCamera, () => playerState(context)?.snapshot()),

                  /* Speed */
                  if (mode.isPlayback) _buildSpeedDropdown(),

                  /* Zoom */
                  // _controlItem(AppAssets.icZoomIn, () {}),
                  // _controlItem(AppAssets.icZoomOut, () {}),

                  /* Fullscreen */
                  _controlItem(
                    AppAssets.icFullscreen,
                    () => playerState(context)?.toggleFullscreen(),
                  ),
                ],
              ),
            ),
          ),

          /*  */
          _buildLiveViewMode(
            mode.isPlayback ? 1 : 0,
            (index) => context.read<CameraDetailBloc>().add(
              ChangeViewMode(index == 0 ? CameraDetailMode.live : CameraDetailMode.playback),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeedDropdown() {
    return BlocSelector<CameraDetailBloc, CameraDetailState, double>(
      selector: (state) => state.speed,
      builder: (context, speed) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE2E8F0)),
            color: AppColors.blackOrWhiteReverse,
            borderRadius: BorderRadius.circular(3),
          ),
          margin: EdgeInsets.only(left: 8),
          child: DropdownButton<double>(
            borderRadius: BorderRadius.circular(3),
            isDense: true,
            underline: SizedBox(),
            elevation: 0,
            value: speed,
            padding: EdgeInsets.fromLTRB(9, 1, 9, 1),
            icon: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SvgPicture.asset(
                AppAssets.icArrowChevronDown,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(Color(0xFF94A3B8), BlendMode.srcIn),
              ),
            ),
            style: AppTypography.style(
              14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey64748B,
            ),
            items: [
              DropdownMenuItem<double>(value: 0.25, child: Text('0.25x')),
              DropdownMenuItem<double>(value: 0.5, child: Text('0.5x')),
              DropdownMenuItem<double>(value: 0.75, child: Text('0.75x')),
              DropdownMenuItem<double>(value: 1, child: Text('1x')),
              DropdownMenuItem<double>(value: 1.25, child: Text('1.25x')),
              DropdownMenuItem<double>(value: 1.5, child: Text('1.5x')),
              DropdownMenuItem<double>(value: 1.75, child: Text('1.75x')),
              DropdownMenuItem<double>(value: 2, child: Text('2x')),
              DropdownMenuItem<double>(value: 2.5, child: Text('2.5x')),
              DropdownMenuItem<double>(value: 3, child: Text('3x')),
              DropdownMenuItem<double>(value: 3.5, child: Text('3.5x')),
              DropdownMenuItem<double>(value: 4, child: Text('4x')),
              DropdownMenuItem<double>(value: 4.5, child: Text('4.5x')),
              DropdownMenuItem<double>(value: 5, child: Text('5x')),
            ],
            onChanged: (speed) {
              if (speed == null) return;
              context.read<CameraDetailBloc>().add(ChangeSpeed(speed));
            },
          ),
        );
      },
    );
  }

  Widget _controlItem(String icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SvgPicture.asset(icon, width: 28, height: 28),
      ),
    );
  }

  Widget _buildLiveViewMode(int initialIndex, Function(int) onToggle) {
    return Container(
      height: 60,
      width: 278,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Color(0xFFF2F4FA))),
      ),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(0xFFF2F4FA),
        ),
        child: DefaultTabController(
          length: 2,
          initialIndex: initialIndex,
          child: TabBar(
            onTap: onToggle,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: AppColors.blackOrWhiteReverse,
            ),
            labelPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            labelColor: AppColors.blackOrWhite,
            unselectedLabelColor: Color(0xFF64748B),
            labelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
            unselectedLabelStyle: AppTypography.style(14, fontWeight: FontWeight.w600),
            tabs: [
              Builder(
                builder: (context) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.icVideoOn,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        IconTheme.of(context).color ?? Colors.transparent,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Liveview'),
                  ],
                ),
              ),
              Builder(
                builder: (context) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppAssets.tabPlayback,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        IconTheme.of(context).color ?? Colors.transparent,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Playback'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

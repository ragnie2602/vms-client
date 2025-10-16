import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../bloc/camera_live/camera_live_bloc.dart';
import '../widgets/volume_with_slide.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key, required this.mode});
  final LiveViewMode mode;

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
                  if (mode.isPlayback) _controlItem(AppAssets.icFastBackward, () {}),

                  /* Pause/Play */
                  _controlItem(AppAssets.icPlay, () {}),

                  /* Backward */
                  if (mode.isPlayback) _controlItem(AppAssets.icFastForward, () {}),

                  /* Record */
                  _controlItem(AppAssets.icRecord, () {}),

                  /* Camera */
                  _controlItem(AppAssets.icCamera, () {}),

                  /* Speed */
                  if (mode.isPlayback) _buildSpeed(),

                  /* Zoom */
                  _controlItem(AppAssets.icZoomIn, () {}),
                  _controlItem(AppAssets.icZoomOut, () {}),

                  /* Fullscreen */
                  _controlItem(AppAssets.icFullscreen, () {}),
                ],
              ),
            ),
          ),

          /*  */
          _buildLiveViewMode(
            mode.isPlayback ? 1 : 0,
            (index) => context.read<CameraLiveBloc>().add(
              ChangeViewMode(index == 0 ? LiveViewMode.live : LiveViewMode.playback),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeed() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE2E8F0)),
        color: AppColors.blackOrWhiteReverse,
        borderRadius: BorderRadius.circular(3),
      ),
      margin: EdgeInsets.only(left: 8),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(3),
        isDense: true,
        underline: SizedBox(),
        elevation: 0,
        value: '1x',
        padding: EdgeInsets.fromLTRB(9, 1, 9, 1),
        icon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(AppAssets.icArrowChevronDown, width: 16, height: 16),
        ),
        style: AppTypography.style(14, fontWeight: FontWeight.w400, color: AppColors.grey64748B),
        items: [
          DropdownMenuItem<String>(value: '1x', child: Text('1x')),
          DropdownMenuItem<String>(value: '2x', child: Text('2x')),
          DropdownMenuItem<String>(value: '3x', child: Text('3x')),
          DropdownMenuItem<String>(value: '4x', child: Text('4x')),
          DropdownMenuItem<String>(value: '5x', child: Text('5x')),
        ],
        onChanged: (_) {},
      ),
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

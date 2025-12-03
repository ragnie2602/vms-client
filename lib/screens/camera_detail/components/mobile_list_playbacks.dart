import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vms_flutter_client/core/constants/assets.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';

import '../../shared/state_builder_mixin.dart';
import '../bloc/camera_detail/camera_detail_bloc.dart';
import '../bloc/playback/playback_bloc.dart';
import '../widgets/mobile_playback_card.dart';

class MobileListPlaybacks extends StatelessWidget with StateBuilderMixin {
  const MobileListPlaybacks({super.key});

  CameraDetailBloc _dBloc(BuildContext context) => context.read<CameraDetailBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /* Select date */
        BlocSelector<CameraDetailBloc, CameraDetailState, DateTime>(
          selector: (state) => state.playbackDate,
          builder: (context, date) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.greyE5E5E5, width: 1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _icon(
                  AppAssets.icArrowChevronLeft,
                  () => _dBloc(context).add(ChangePlaybackDate(date.subtract(Duration(days: 1)))),
                ),
                Text(
                  date.format('dd/MM/yyyy'),
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackOrWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                _icon(
                  AppAssets.icArrowChevronRight,
                  () => _dBloc(context).add(ChangePlaybackDate(date.add(Duration(days: 1)))),
                  disabled: _dBloc(
                    context,
                  ).state.playbackDate.startOfNextDay.isAfter(DateTime.now()),
                ),
              ],
            ),
          ),
        ),

        /* List playbacks */
        Expanded(
          child: BlocBuilder<PlaybackBloc, PlaybackState>(
            builder: (context, state) => stateBuilder<PlaybackSuccess>(
              state,
              emptyBuilder: () => Center(
                child: Text(
                  'Không có đoạn video nào được lưu trong khoảng thời gian này.',
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: AppTypography.style(
                    14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey666666,
                  ),
                ),
              ),
              child: (state) => ListView.builder(
                itemCount: state.playbacks.length,
                itemBuilder: (context, index) => MobilePlaybackCard(
                  onTap: () => context
                      .read<CameraDetailBloc>()
                      .state
                      .playerController
                      .jumpToDate
                      ?.call(state.playbacks[index].startTime, dateIndex: index),
                  key: ValueKey(state.playbacks[index].playbackId),
                  playback: state.playbacks[index],
                  backgroundColor: state.currentIndex == index
                      ? AppColors.greyF2F4FA
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _icon(String icon, VoidCallback onTap, {bool disabled = false}) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: disabled ? ColorFilter.mode(Color(0xFFB2B2B2), BlendMode.srcIn) : null,
      ),
    );
  }
}

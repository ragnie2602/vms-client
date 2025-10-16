import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/colors.dart';
import 'package:vms_flutter_client/core/constants/typography.dart';

import '../../shared/state_builder_mixin.dart';
import '../bloc/playback/playback_bloc.dart';

class PanelListPlaybacks extends StatelessWidget with StateBuilderMixin {
  const PanelListPlaybacks({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaybackBloc, PlaybackState>(
      builder: (context, state) => stateBuilder<PlaybackSuccess>(
        state,
        child: (state) => Material(
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: state.playbacks.length,
            itemBuilder: (context, index) {
              final playback = state.playbacks[index];

              return InkWell(
                onTap: () => context.read<PlaybackBloc>().add(ChangePlayback(playback)),
                child: Container(
                  decoration: BoxDecoration(
                    color: state.currentPlayback == playback ? AppColors.greyF2F4FA : null,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Playback: ${_formatTime(playback.startTime)} -> ${_formatTime(playback.endTime)}",
                    style: AppTypography.style(
                      14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackOrWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }
}

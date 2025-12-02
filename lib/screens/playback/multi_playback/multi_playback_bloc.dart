import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_event.dart';
import 'package:vms_flutter_client/screens/playback/multi_playback/multi_playback_state.dart';

class MultiPlaybackBloc
    extends BaseBloc<MultiPlaybackEvent, MultiPlaybackState> {
  MultiPlaybackBloc()
    : super(MultiPlaybackState(playbackDate: DateTime.now())) {
      on<ChangePlaybackDate>(_onChangePlaybackDate);
    }

    FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<MultiPlaybackState> emit,
  ) async {
    // update change date for multi playback
    if (state.playbackDate == event.date) return;

    emit(state.copyWith(playbackDate: event.date));
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';

part 'playback_event.dart';
part 'playback_state.dart';

class PlaybackBloc extends BaseBloc<PlaybackEvent, PlaybackState> {
  final IPlaybackRepository playbackRepository;

  PlaybackBloc(this.playbackRepository) : super(PlaybackInitial()) {
    on<GetVideoPlaybacks>(_onGetVideoPlaybacks);
  }

  FutureOr<void> _onGetVideoPlaybacks(GetVideoPlaybacks event, Emitter<PlaybackState> emit) async {
    emit(PlaybackLoading());

    (await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: event.id,
      currentTime: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      timeZone: 7,
    )).fold(
      (failure) {
        emit(PlaybackFailure(failure.toString()));
      },
      (playbacks) {
        emit(PlaybackSuccess(playbacks));
      },
    );
  }
}

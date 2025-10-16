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
    on<SetPlaybackAtTime>(_onSetPlaybackAtTime);
    on<ChangePlayback>(_onChangePlayback);
  }

  List<int> _belongCameraId = [];

  FutureOr<void> _onGetVideoPlaybacks(GetVideoPlaybacks event, Emitter<PlaybackState> emit) async {
    if (state is PlaybackSuccess && _belongCameraId == event.id) {
      return emit(
        (state as PlaybackSuccess).copyWith(
          setStartTimeInstantly: true,
          currentPlayback: (state as PlaybackSuccess).playbacks.firstOrNull,
        ),
      );
    }

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
        _belongCameraId = event.id;
        emit(
          PlaybackSuccess(
            playbacks: playbacks,
            currentPlayback: playbacks.firstOrNull,
            setStartTimeInstantly: true,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSetPlaybackAtTime(SetPlaybackAtTime event, Emitter<PlaybackState> emit) async {
    if (state is! PlaybackSuccess) return;

    final playback = (state as PlaybackSuccess).binarySearch(event.time);
    final duration = playback?.startTime.difference(event.time).inMilliseconds.abs();

    emit(
      (state as PlaybackSuccess).copyWith(
        currentPlayback: playback,
        currentDuration: duration,
        currentPlaybackCanNull: true,
      ),
    );
  }

  FutureOr<void> _onChangePlayback(ChangePlayback event, Emitter<PlaybackState> emit) async {
    if (state is! PlaybackSuccess) return;
    final success = state as PlaybackSuccess;

    if (success.currentPlayback == event.playback) return;
    emit(
      success.copyWith(
        currentPlayback: event.playback,
        currentDuration: null,
        setStartTimeInstantly: true,
      ),
    );
  }
}

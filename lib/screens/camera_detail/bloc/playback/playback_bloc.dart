import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/background_task.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/core/utils/logger.dart';
import 'package:vms_flutter_client/data/datasources/protobuf_http_client.dart';
import 'package:vms_flutter_client/domain/entities/playback/playback_video.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:path/path.dart' as p;

part 'playback_event.dart';
part 'playback_state.dart';

class PlaybackBloc extends BaseBloc<PlaybackEvent, PlaybackState> {
  final IPlaybackRepository playbackRepository;
  final ProtobufHttpClient client;

  PlaybackBloc(this.playbackRepository, this.client) : super(PlaybackInitial()) {
    on<GetVideoPlaybacks>(_onGetVideoPlaybacks);
    on<ChangePlayback>(_onChangePlayback);
    on<DownloadPlayback>(_onDownloadPlayback);
  }

  List<int> _belongCameraId = [];
  DateTime _belongDate = DateTime.now();

  FutureOr<void> _onGetVideoPlaybacks(GetVideoPlaybacks event, Emitter<PlaybackState> emit) async {
    if (state is PlaybackSuccess && _belongCameraId == event.id && _belongDate == event.date) {
      return;
    }

    emit(PlaybackLoading());

    (await playbackRepository.getTimeShiftVideoCloudCamera(
      cameraId: event.id,
      currentTime: event.date.endOfDay.millisecondsSinceEpoch ~/ 1000,
      timeZone: 7,
    )).fold(
      (failure) {
        emit(PlaybackFailure(failure.toString()));
      },
      (playbacks) {
        _belongCameraId = event.id;
        _belongDate = event.date;
        emit(
          PlaybackSuccess(initialIndex: 0, playbacks: playbacks.reversed.toList(), currentIndex: 0),
        );
      },
    );
  }

  FutureOr<void> _onChangePlayback(ChangePlayback event, Emitter<PlaybackState> emit) async {
    if (state is! PlaybackSuccess) return;
    final success = state as PlaybackSuccess;

    if (success.currentIndex == event.index) return;
    emit(success.copyWith(currentIndex: event.index));
  }

  FutureOr<void> _onDownloadPlayback(DownloadPlayback event, Emitter<PlaybackState> emit) async {
    try {
      final extension = p.extension(event.playback.urlPlayback);
      final fileName = p.basenameWithoutExtension(event.playback.urlPlayback);

      final saveLocation = await FileUtil.selectSaveLocation(fileName, extension);
      if (saveLocation == null) return;

      BackgroundTask.download(
        url: event.playback.urlPlayback,
        savePath: saveLocation,
        onProgress: event.onProgress,
        onComplete: () => event.onProgress?.call(null),
        onError: (error) => event.onError?.call(error.toString()),
      );
    } catch (e) {
      Logger.error(e, writeLog: true);
      event.onError?.call(kReleaseMode ? null : e.toString());
    }
  }
}

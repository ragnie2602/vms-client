import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
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
    on<SetPlaybackAtTime>(_onSetPlaybackAtTime);
    on<ChangePlayback>(_onChangePlayback);
    on<DownloadPlayback>(_onDownloadPlayback);
  }

  List<int> _belongCameraId = [];
  DateTime _belongDate = DateTime.now();

  FutureOr<void> _onGetVideoPlaybacks(GetVideoPlaybacks event, Emitter<PlaybackState> emit) async {
    if (state is PlaybackSuccess && _belongCameraId == event.id && _belongDate == event.date) {
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

  FutureOr<void> _onDownloadPlayback(DownloadPlayback event, Emitter<PlaybackState> emit) async {
    try {
      final extension = p.extension(event.playback.urlPlayback);
      final fileName = p.basenameWithoutExtension(event.playback.urlPlayback);

      final saveLocation = await FileUtil.selectSaveLocation(fileName, extension);
      if (saveLocation == null) return;

      await client.dio.download(
        event.playback.urlPlayback,
        saveLocation,
        onReceiveProgress: (received, total) {
          if (total != -1) event.onProgress?.call(received / total);
        },
      );
    } catch (e) {
      Logger.error(e);
    } finally {
      event.onProgress?.call(null);
    }
  }
}

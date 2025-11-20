import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_stream.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

import '../../components/player_timeline.dart';
import '../../widgets/camera_detail_player.dart';

part 'camera_detail_event.dart';
part 'camera_detail_state.dart';

class CameraDetailBloc extends Bloc<CameraDetailEvent, CameraDetailState> {
  CameraDetailBloc({required CameraDetailMode mode, required CameraEntity? camera})
    : super(
        CameraDetailState(
          mode: mode,
          camera: camera,
          playbackDate: DateTime.now(),
          cameraDetailController: CameraDetailController(),
          stream: camera?.stream.streamLinks.firstWhereOrNull((e) => e.isMainStream),
        ),
      ) {
    on<ChangeViewMode>(_onChaneViewMode);
    on<ChangeCamera>(_onChangeCamera);
    on<ChangePlayerStatus>(_onChangePlayerStatus);
    on<SeekPlayer>(_onSeekPlayer, transformer: sequential());
    on<ChangeVolume>(_onChangeVolume, transformer: sequential());
    on<ChangeSpeed>(_onChangeSpeed, transformer: sequential());
    on<ChangePlaybackDate>(_onChangePlaybackDate);
    on<ChangeTimelineDisplayMode>(_onChangeTimelineDisplayMode);
    on<OnRecording>(_onOnRecording);
    on<ChangeStream>(_onChangeStream);
  }

  FutureOr<void> _onChaneViewMode(ChangeViewMode event, Emitter<CameraDetailState> emit) async {
    if (state.mode == event.mode) return;

    emit(
      state.copyWith(
        mode: event.mode,
        volume: 100,
        speed: 1,
        recordingStatus: 0,
        status: PlayerStatus.playing,
        playbackDate: DateTime.now(),
        cameraDetailController: CameraDetailController(), // Instance mới
      ),
    );
  }

  FutureOr<void> _onChangeCamera(ChangeCamera event, Emitter<CameraDetailState> emit) async {
    if (state.camera?.id == event.camera.id) return;

    emit(
      state.copyWith(
        camera: event.camera,
        stream: event.camera.stream.streamLinks.firstWhereOrNull((e) => e.isMainStream),
        volume: 100,
        speed: 1,
        status: PlayerStatus.playing,
        cameraDetailController: CameraDetailController(), // Instance mới
      ),
    );
  }

  FutureOr<void> _onChangePlayerStatus(ChangePlayerStatus event, Emitter<CameraDetailState> emit) {
    if (state.status == event.status) return null;

    emit(state.copyWith(status: event.status));
  }

  FutureOr<void> _onSeekPlayer(SeekPlayer event, Emitter<CameraDetailState> emit) async {
    await state.cameraDetailController.ref.currentState?.seek(event.amount);
  }

  FutureOr<void> _onChangeVolume(ChangeVolume event, Emitter<CameraDetailState> emit) async {
    await state.cameraDetailController.ref.currentState?.changeVolume(event.volume);

    emit(state.copyWith(volume: event.volume));
  }

  FutureOr<void> _onChangeSpeed(ChangeSpeed event, Emitter<CameraDetailState> emit) async {
    await state.cameraDetailController.ref.currentState?.changeSpeed(event.speed);

    emit(state.copyWith(speed: event.speed));
  }

  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<CameraDetailState> emit,
  ) async {
    if (state.playbackDate == event.date) return;

    emit(state.copyWith(playbackDate: event.date));
  }

  FutureOr<void> _onChangeTimelineDisplayMode(
    ChangeTimelineDisplayMode event,
    Emitter<CameraDetailState> emit,
  ) async {
    if (state.timelineDisplayMode == event.mode) return;

    emit(state.copyWith(timelineDisplayMode: event.mode));
  }

  FutureOr<void> _onOnRecording(OnRecording event, Emitter<CameraDetailState> emit) async {
    if (event.cancelStatus != null) {
      return emit(state.copyWith(recordingStatus: event.cancelStatus));
    }

    if (state.isRecording == true) return;

    if (state.cameraDetailController.ref.currentState?.isInitialized != true) {
      return event.cb?.call(null, null);
    }

    final output = await event.buildPath?.call();
    if (output == null) return event.cb?.call(null, null);

    emit(state.copyWith(recordingStatus: 1));
    final res = await state.cameraDetailController.ref.currentState?.recording(output);

    event.cb?.call(res, output);
    emit(state.copyWith(recordingStatus: res != null ? 1 : 0));
  }

  FutureOr<void> _onChangeStream(ChangeStream event, Emitter<CameraDetailState> emit) async {
    if (state.stream == event.stream) return;

    emit(state.copyWith(stream: event.stream));
  }
}

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

import '../../components/player_timeline.dart';
import '../../widgets/camera_live_player.dart';

part 'camera_live_event.dart';
part 'camera_live_state.dart';

class CameraLiveBloc extends Bloc<CameraLiveEvent, CameraLiveState> {
  CameraLiveBloc({required LiveViewMode mode, required CameraEntity camera})
    : super(
        CameraLiveState(
          mode: mode,
          camera: camera,
          playbackDate: DateTime.now(),
          cameraLiveController: CameraLiveController(),
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
  }

  FutureOr<void> _onChaneViewMode(ChangeViewMode event, Emitter<CameraLiveState> emit) async {
    if (state.mode == event.mode) return;

    emit(
      state.copyWith(
        mode: event.mode,
        volume: 100,
        speed: 1,
        status: PlayerStatus.playing,
        playbackDate: DateTime.now(),
        cameraLiveController: CameraLiveController(), // Instance mới
      ),
    );
  }

  FutureOr<void> _onChangeCamera(ChangeCamera event, Emitter<CameraLiveState> emit) async {
    if (state.camera.id == event.camera.id) return;

    emit(state.copyWith(camera: event.camera, volume: 100, speed: 1, status: PlayerStatus.playing));
  }

  FutureOr<void> _onChangePlayerStatus(ChangePlayerStatus event, Emitter<CameraLiveState> emit) {
    if (state.status == event.status) return null;

    emit(state.copyWith(status: event.status));
  }

  FutureOr<void> _onSeekPlayer(SeekPlayer event, Emitter<CameraLiveState> emit) async {
    await state.cameraLiveController.ref.currentState?.seek(event.amount);
  }

  FutureOr<void> _onChangeVolume(ChangeVolume event, Emitter<CameraLiveState> emit) async {
    await state.cameraLiveController.ref.currentState?.changeVolume(event.volume);

    emit(state.copyWith(volume: event.volume));
  }

  FutureOr<void> _onChangeSpeed(ChangeSpeed event, Emitter<CameraLiveState> emit) async {
    await state.cameraLiveController.ref.currentState?.changeSpeed(event.speed);

    emit(state.copyWith(speed: event.speed));
  }

  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<CameraLiveState> emit,
  ) async {
    if (state.playbackDate == event.date) return;

    emit(state.copyWith(playbackDate: event.date));
  }

  FutureOr<void> _onChangeTimelineDisplayMode(
    ChangeTimelineDisplayMode event,
    Emitter<CameraLiveState> emit,
  ) async {
    if (state.timelineDisplayMode == event.mode) return;

    emit(state.copyWith(timelineDisplayMode: event.mode));
  }
}

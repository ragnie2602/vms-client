import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/app_config.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/core/utils/file_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_stream.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../../shared/player/sources.dart';
import '../../components/player_timeline.dart';

part 'camera_detail_event.dart';
part 'camera_detail_state.dart';

class CameraDetailBloc extends Bloc<CameraDetailEvent, CameraDetailState> {
  CameraDetailBloc({required CameraDetailMode mode, required CameraEntity? camera})
    : super(
        CameraDetailState(
          mode: mode,
          camera: camera,
          playbackDate: DateTime.now(),
          playerController: PlayerController(),
          stream: camera?.stream.streamLinks.firstWhereOrNull((e) => e.isMainStream),
        ),
      ) {
    on<ChangeViewMode>(_onChaneViewMode);
    on<ChangeCamera>(_onChangeCamera);
    on<ChangePlayerStatus>(_onChangePlayerStatus);
    on<SeekPlayer>(_onSeekPlayer);
    on<ChangeVolume>(_onChangeVolume, transformer: sequential());
    on<ChangeSpeed>(_onChangeSpeed, transformer: sequential());
    on<ChangePlaybackDate>(_onChangePlaybackDate);
    on<ChangeTimelineDisplayMode>(_onChangeTimelineDisplayMode);
    on<OnRecording>(_onOnRecording);
    on<ChangeStream>(_onChangeStream);
    on<ToggleMute>(_onToggleMute, transformer: sequential());
    on<TakeSnapshot>(_onTakeSnapshot, transformer: droppable());
    on<OnDefaultValues>(_onOnDefaultValues);
    on<PausePlayer>(_onPausePlayer);
  }

  FutureOr<void> _onPausePlayer(
    PausePlayer event,
    Emitter<CameraDetailState> emit,
  ) async {
    await state.playerController.pause?.call();
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
        playerController: PlayerController(), // Instance mới
      ),
    );
  }

  FutureOr<void> _onChangeCamera(ChangeCamera event, Emitter<CameraDetailState> emit) async {
    if (state.camera?.id == event.camera.id) return;

    // Đổi cam playback
    // + playback --> state đổi loading - loaded ... --> widget cũ tự bị dispose - init lại khi thành công
    // + liveview --> sử lý didUpdateWidget để update source
    emit(
      state.copyWith(
        camera: event.camera,
        stream: event.camera.stream.streamLinks.firstWhereOrNull((e) => e.isMainStream),
        volume: 100,
        speed: 1,
        status: PlayerStatus.playing,
      ),
    );
  }

  FutureOr<void> _onChangePlayerStatus(ChangePlayerStatus event, Emitter<CameraDetailState> emit) {
    if (state.status == event.status) return null;

    emit(state.copyWith(status: event.status));
  }

  FutureOr<void> _onSeekPlayer(SeekPlayer event, Emitter<CameraDetailState> emit) async {
    if (state.playerController.isInitialized?.call() != true) return;

    state.playerController.seek?.call(event.amount);
  }

  FutureOr<void> _onChangeVolume(ChangeVolume event, Emitter<CameraDetailState> emit) async {
    if (state.playerController.isInitialized?.call() != true) return;
    if (state.volume == event.volume) return;

    state.playerController.changeVolume?.call(event.volume);
    emit(state.copyWith(volume: event.volume));
    final volume = event.volume.clamp(0, AppConfig.PLAYER_MAX_VOLUME_PERCENT).toDouble();
    state.playerController.changeVolume?.call(volume);

    emit(state.copyWith(volume: volume));
  }

  FutureOr<void> _onToggleMute(ToggleMute event, Emitter<CameraDetailState> emit) async {
    if (state.playerController.isInitialized?.call() != true) return;

    if (state.volume <= 0) {
      final deviceVolume = await VolumeController.instance.getVolume();
      state.playerController.changeVolume?.call(deviceVolume, syncSystemVolume: false);
      emit(state.copyWith(volume: deviceVolume));
    } else {
      state.playerController.changeVolume?.call(0, syncSystemVolume: false);
      emit(state.copyWith(volume: 0));
    }
  }

  FutureOr<void> _onChangeSpeed(ChangeSpeed event, Emitter<CameraDetailState> emit) async {
    if (state.playerController.isInitialized?.call() != true) return;

    emit(state.copyWith(speed: event.speed));

    await state.playerController.changeSpeed?.call(event.speed);
  }

  FutureOr<void> _onChangePlaybackDate(
    ChangePlaybackDate event,
    Emitter<CameraDetailState> emit,
  ) async {
    // update change date for multi playback
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
    if (state.playerController.isInitialized?.call() != true) return;

    if (event.cancelStatus != null) {
      return emit(state.copyWith(recordingStatus: event.cancelStatus));
    }

    if (state.isRecording == true) return;

    if (state.playerController.isInitialized?.call() != true) {
      return event.cb?.call(null, null);
    }

    final output = await event.buildPath?.call();
    if (output == null) return event.cb?.call(null, null);

    emit(state.copyWith(recordingStatus: 1));
    final res = await state.playerController.recording?.call(output);

    event.cb?.call(res, output);
    emit(state.copyWith(recordingStatus: res != null ? 1 : 0));
  }

  FutureOr<void> _onChangeStream(ChangeStream event, Emitter<CameraDetailState> emit) async {
    if (state.stream == event.stream) return;

    emit(state.copyWith(stream: event.stream));
  }

  FutureOr<void> _onTakeSnapshot(TakeSnapshot event, Emitter<CameraDetailState> emit) async {
    if (state.playerController.isInitialized?.call() != true) return;

    bool granted = await Gal.hasAccess();
    if (!granted) granted = await Gal.requestAccess();
    if (!granted) return;

    final tempPath = Directory.systemTemp.path.joinPath(
      '${state.camera?.name ?? 'camera'}_${DateTime.now().format("yyyyMMdd_HHmmss")}.jpg',
    );
    final res = await state.playerController.snapshot?.call(tempPath);
    if (res == true) {
      await Gal.putImage(tempPath);
      File(tempPath).delete();

      event.onSuccess?.call();
    }
  }

  FutureOr<void> _onOnDefaultValues(OnDefaultValues event, Emitter<CameraDetailState> emit) async {
    emit(state.copyWith(volume: event.volume, speed: event.speed, recordingStatus: 0));
  }
}

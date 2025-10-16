import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/screens/monitor/widgets/camera_player.dart';

part 'camera_live_event.dart';
part 'camera_live_state.dart';

class CameraLiveBloc extends Bloc<CameraLiveEvent, CameraLiveState> {
  CameraLiveBloc({required LiveViewMode mode, required CameraEntity camera})
    : super(CameraLiveState(mode: mode, camera: camera, ref: GlobalKey<CameraPlayerState>())) {
    on<ChangeViewMode>(_onChaneViewMode);
    on<ChangeCamera>(_onChangeCamera);
    on<ChangePlayerSource>(_onChangePlayerSource, transformer: sequential());
    on<ChangePlayerStatus>(_onChangePlayerStatus);
  }

  FutureOr<void> _onChaneViewMode(ChangeViewMode event, Emitter<CameraLiveState> emit) async {
    if (state.mode == event.mode) return;

    emit(state.copyWith(mode: event.mode, ref: GlobalKey<CameraPlayerState>()));
  }

  FutureOr<void> _onChangeCamera(ChangeCamera event, Emitter<CameraLiveState> emit) async {
    if (state.camera.id == event.camera.id) return;

    emit(state.copyWith(camera: event.camera, ref: GlobalKey<CameraPlayerState>()));
  }

  FutureOr<void> _onChangePlayerSource(
    ChangePlayerSource event,
    Emitter<CameraLiveState> emit,
  ) async {
    await state.ref.currentState?.switchSource(
      event.source,
      position: event.position,
      onDuration: event.onDuration,
    );
  }

  FutureOr<void> _onChangePlayerStatus(ChangePlayerStatus event, Emitter<CameraLiveState> emit) {
    if (state.status == event.status) return null;

    emit(state.copyWith(status: event.status));
  }
}

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fvp/mdk.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class MonitorBloc extends BaseBloc<MonitorEvent, MonitorState> {
  MonitorBloc(this.cameraRepository) : super(MonitorInitial()) {
    on<GetAllCamera>(_onGetAllCamera);
    on<ChangeGridMode>(_onChangeGridMode);
    on<DisposePlayer>(_onDisposePlayer, transformer: sequential());
  }

  final ICameraRepository cameraRepository;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<MonitorState> emit) async {
    emit(MonitorLoading());

    (await cameraRepository.getAllCamera()).fold(
      (failure) {
        emit(MonitorFailure(failure.toString()));
      },
      (cameras) {
        emit(
          MonitorSuccess(
            cameras: cameras,
            mode: ViewMode.fitWithLength(cameras.length, min: ViewMode.v2x2),
          ),
        );
      },
    );
  }

  FutureOr<void> _onDisposePlayer(DisposePlayer event, Emitter<MonitorState> emit) async {
    if (event.sequentialMode) {
      await event.player.dispose();
    } else {
      event.player.dispose();
    }
  }

  FutureOr<void> _onChangeGridMode(ChangeGridMode event, Emitter<MonitorState> emit) async {
    if (state is! MonitorSuccess) return;

    final preState = state as MonitorSuccess;
    if (preState.mode != event.mode) emit(preState.copyWith(mode: event.mode));
  }
}

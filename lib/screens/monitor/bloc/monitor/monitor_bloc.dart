import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class MonitorBloc extends BaseBloc<MonitorEvent, MonitorState> {
  MonitorBloc(this.filterCameraNoGroupUseCase, this.cameraRepository) : super(MonitorInitial()) {
    on<GetAllCamera>(_onGetAllCamera);
    on<ChangeGridMode>(_onChangeGridMode);
    on<GetCameraAtPage>(_onGetCameraAtPage);
    on<GetAllCameraInGroup>(_onGetAllCameraInGroup);
    on<GetAllCameraNoGroup>(_onGetAllCameraNoGroup);

    on<ResetFilter>(_onResetFilter);
  }

  final FilterCameraNoGroupUseCase filterCameraNoGroupUseCase;
  final ICameraRepository cameraRepository;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<MonitorState> emit) async {
    final MonitorSuccess? lastState = state is MonitorSuccess ? state as MonitorSuccess : null;

    emit(MonitorLoading());

    (await cameraRepository.getAllCamera()).fold(
      (failure) {
        emit(MonitorFailure(failure.toString()));
      },
      (cameras) {
        emit(
          MonitorSuccess(
            cameras: cameras,
            mode: lastState?.mode ?? ViewMode.v2x2 ,
          ),
        );
      },
    );
  }

  FutureOr<void> _onGetAllCameraInGroup(
    GetAllCameraInGroup event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());

    (await cameraRepository.getAllCamerasInGroup(groupId: event.groupId)).fold(
      (failure) {
        emit(MonitorFailure(failure.toString()));
      },
      (cameras) {
        emit(
          MonitorSuccess(
            cameras: cameras,
            mode: ViewMode.fitWithLength(cameras.length, min: ViewMode.v2x2),
            groupId: event.groupId,
          ),
        );
      },
    );
  }

  FutureOr<void> _onGetAllCameraNoGroup(
    GetAllCameraNoGroup event,
    Emitter<MonitorState> emit,
  ) async {
    emit(MonitorLoading());

    final groups = await cameraRepository.getAllCamera();
    groups.fold(
      (failure) {
        emit(MonitorFailure(failure.toString()));
      },
      (cameras) {
        // filter camera no group
        final input = FilterCameraNoGroupInput(listCameraOrigin: cameras);
        final output = filterCameraNoGroupUseCase.execute(input);
        final filteredCameras = output.listCamera ?? [];
        emit(
          MonitorSuccess(
            cameras: filteredCameras,
            mode: ViewMode.fitWithLength(filteredCameras.length, min: ViewMode.v2x2),
            groupId: [],
          ),
        );
      },
    );
  }

  Future<void> _onGetCameraAtPage(GetCameraAtPage event, Emitter<MonitorState> emit) async {
    if (state is MonitorSuccess) {
      final preState = state as MonitorSuccess;
      emit(
        MonitorSuccess(
          cameras: preState.cameras,
          mode: preState.mode,
          page: event.page,
          groupId: preState.groupId,
        ),
      );
      return;
    }

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
            page: event.page,
            groupId: null,
          ),
        );
      },
    );
  }

  FutureOr<void> _onChangeGridMode(ChangeGridMode event, Emitter<MonitorState> emit) async {
    if (state is! MonitorSuccess) {
      await _onGetAllCamera(GetAllCamera(mode: event.mode), emit);
      return;
    }

    final preState = state as MonitorSuccess;
    if (preState.mode != event.mode) emit(preState.copyWith(mode: event.mode, page: 1));
  }

  FutureOr<void> _onResetFilter(ResetFilter event, Emitter<MonitorState> emit) {
    emit(MonitorInitial());
  }
}

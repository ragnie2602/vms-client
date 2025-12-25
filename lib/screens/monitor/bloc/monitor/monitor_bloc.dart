import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/core/utils/task_pool.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_input.dart';
import 'package:vms_flutter_client/domain/usecases/control_camera/filter_no_group/filter_camera_no_group_use_case.dart';

part 'monitor_event.dart';
part 'monitor_state.dart';

class FilterData {
  Set<TagEntity> selectedTags = {};
  String searchText = '';
}

class MonitorBloc extends BaseBloc<MonitorEvent, MonitorState> {
  MonitorBloc(
    this.filterCameraNoGroupUseCase,
    this.cameraRepository,
    this.subscribeMultiWindowEventUseCase,
  ) : super(MonitorInitial()) {
    on<GetAllCamera>(_onGetAllCamera, transformer: droppable());
    on<ChangeGridMode>(_onChangeGridMode);
    on<GetCameraAtPage>(_onGetCameraAtPage);
    on<GetAllCameraInGroup>(_onGetAllCameraInGroup);
    on<GetAllCameraNoGroup>(_onGetAllCameraNoGroup);

    on<ResetFilter>(_onResetFilter);

    on<ReopenMonitor>(_onReopenMonitor);
  }

  final FilterCameraNoGroupUseCase filterCameraNoGroupUseCase;
  final SubscribeMultiWindowEventUseCase subscribeMultiWindowEventUseCase;
  final ICameraRepository cameraRepository;

  late final filterData = FilterData();
  bool shouldRefreshAllCameras = false;

  FutureOr<void> _onGetAllCamera(GetAllCamera event, Emitter<MonitorState> emit) async {
    if (state is MonitorSuccess && event.refresh && !shouldRefreshAllCameras) return;

    shouldRefreshAllCameras = false;
    final MonitorSuccess? lastState = state is MonitorSuccess ? state as MonitorSuccess : null;

    emit(MonitorLoading());

    (await cameraRepository.getAllCamera()).fold(
      (failure) {
        emit(MonitorFailure(failure.toString()));
      },
      (cameras) {
        emit(MonitorSuccess(cameras: cameras, mode: lastState?.mode ?? ViewMode.v2x2));
      },
    );
  }

  FutureOr<void> _onGetAllCameraInGroup(
    GetAllCameraInGroup event,
    Emitter<MonitorState> emit,
  ) async {
    TaskPool.instance.clean();
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
    TaskPool.instance.clean();
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
    TaskPool.instance.clean();

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
    if (preState.mode != event.mode) {
      // Case tăng mode --> clean --> đoạn cuối có thể bị clean (~ loading mãi)
      // Chỉ clean khi giảm mode
      if (preState.mode.total > event.mode.total) TaskPool.instance.clean();
      emit(preState.copyWith(mode: event.mode, page: 1));
    }
  }

  FutureOr<void> _onResetFilter(ResetFilter event, Emitter<MonitorState> emit) {
    emit(MonitorInitial());
  }

  FutureOr<void> _onReopenMonitor(ReopenMonitor event, Emitter<MonitorState> emit) async {
    if (event.id.isEmpty) {
      await _onGetAllCamera(GetAllCamera(mode: ViewMode.fromValue(event.mode)), emit);
    } else if (event.id.length == 1) {
      await _onGetAllCameraNoGroup(GetAllCameraNoGroup(), emit);
    } else {
      await _onGetAllCameraInGroup(GetAllCameraInGroup(event.id), emit);
    }

    if (event.mode != ViewMode.v2x2.value) {
      await _onChangeGridMode(ChangeGridMode(ViewMode.fromValue(event.mode)), emit);
    }
  }
}

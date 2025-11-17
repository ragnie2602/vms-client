import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_event.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_state.dart';

class ScheduleBloc extends BaseBloc<ScheduleEvent, ScheduleState> {
  final ICameraRepository cameraRepository;
  ScheduleBloc({required this.cameraRepository})
    : super(const ScheduleState()) {
    on<GetListCameraEvent>(_onGetListCamera);
    on<ChangeCameraEvent>(_onChangeCamera);
  }

  FutureOr<void> _onGetListCamera(
    GetListCameraEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(ScheduleLoadingState());
    final cameras = await cameraRepository.getAllCamera();
    cameras.fold(
      (onFailure) {
        // handeler fail list camera
      },
      (onSuccess) {
        List<CameraEntity> _list = onSuccess;
        emit(
          ScheduleSuccessState(
            listCamera: _list,
            cameraSelected: _list.isEmpty ? null : _list.first,
          ),
        );
      },
    );
  }

  FutureOr<void> _onChangeCamera(
    ChangeCameraEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    if ((state is ScheduleSuccessState) == false) {
      await _onGetListCamera(GetListCameraEvent(), emit);
      return;
    }
    final currentState = state;
    if (currentState is ScheduleSuccessState) {
      if (currentState.cameraSelected != event.newCamera) {
        emit(currentState.copyWith(cameraSelected: event.newCamera));
      }
    }
    // load list schedule recording of new camera
  }
}

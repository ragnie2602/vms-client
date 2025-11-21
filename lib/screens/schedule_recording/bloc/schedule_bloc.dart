import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_schedule_repository.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_event.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_state.dart';
import 'package:vms_flutter_client/screens/schedule_recording/config_dialog.dart';

class ScheduleBloc extends BaseBloc<ScheduleEvent, ScheduleState> {
  final ICameraRepository cameraRepository;
  final IScheduleRepository scheduleRepository;
  ScheduleBloc({
    required this.cameraRepository,
    required this.scheduleRepository,
  }) : super(const ScheduleState()) {
    on<InitScheduleEvent>(_initSchedule);
    on<ChangeTabEvent>(_changeTab);
    on<SubmitNewScheduleRecordEvent>(_updateConfigSchedule);
  }
  FutureOr<void> _initSchedule(
    InitScheduleEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    // loading
    emit(ScheduleLoadingState());
    // res API
    final cameraInfo = await cameraRepository.getCameraInfo(
      cameraId: event.cameraId,
    );
    cameraInfo.fold(
      (failure) {
        emit(ScheduleErrorState(message: failure.toString()));
      },
      (succsess) {
        // emit success
        emit(
          ScheduleSuccessState(
            selectedTab: ConfigCameraTab.generalConfig,
            cameraInfo: succsess,
          ),
        );
      },
    );
  }

  FutureOr<void> _changeTab(
    ChangeTabEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    if (state is ScheduleSuccessState) {
      final currentState = state as ScheduleSuccessState;
      emit(currentState.copyWith(selectedTab: event.newTab));
    }
  }

  // update lịch ghi hình
  FutureOr<void> _updateConfigSchedule(
    SubmitNewScheduleRecordEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    //
    var currentState = state;
    if (state is ScheduleSuccessState) {
      currentState = state as ScheduleSuccessState;
    }
    // res API
    final newCam = await scheduleRepository.configScheduleRecording(
      cameraId: event.cameraId,
      record: event.newRecording,
    );
    newCam.fold(
      (onFailure) {
        emit(UpdateConfigFailState(message: onFailure.toString()));
        emit(currentState);
      },
      (onSuccess) {
        emit(UpdateConfigSuccessState());
        emit(currentState);
      },
    );
  }
}

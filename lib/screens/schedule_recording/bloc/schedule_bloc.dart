import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_event.dart';
import 'package:vms_flutter_client/screens/schedule_recording/bloc/schedule_state.dart';
import 'package:vms_flutter_client/screens/schedule_recording/config_dialog.dart';

class ScheduleBloc extends BaseBloc<ScheduleEvent, ScheduleState> {
  final ICameraRepository cameraRepository;
  ScheduleBloc({required this.cameraRepository})
    : super(const ScheduleState()) {
    on<InitScheduleEvent>(_initSchedule);
    on<ChangeTabEvent>(_changeTab);
  }
  void _initSchedule(InitScheduleEvent event, Emitter<ScheduleState> emit) {
    emit(ScheduleSuccessState(selectedTab: ConfigCameraTab.generalConfig));
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
}

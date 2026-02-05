import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_alarm_config.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_camera_repository.dart';

part 'alarm_config_event.dart';
part 'alarm_config_state.dart';

class AlarmConfigBloc extends Bloc<AlarmConfigEvent, AlarmConfigState> {
  final ICameraRepository cameraRepository;

  AlarmConfigBloc(this.cameraRepository) : super(AlarmConfigInitial()) {
    on<GetCameraAiAlarmConfigs>(_getCameraAiAlarmConfigs);
  }

  FutureOr<void> _getCameraAiAlarmConfigs(
    GetCameraAiAlarmConfigs event,
    Emitter<AlarmConfigState> emit,
  ) async {
    emit(AlarmConfigLoading());

    final result = await cameraRepository.getAiAlarmConfigs(event.cameraId);

    result.fold(
      (failure) => emit(AlarmConfigError(message: failure.toString())),
      (alarmConfigs) => emit(AlarmConfigLoaded(alarmConfigs: alarmConfigs)),
    );
  }
}

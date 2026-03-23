part of 'alarm_config_bloc.dart';

sealed class AlarmConfigEvent extends Equatable {
  const AlarmConfigEvent();

  @override
  List<Object> get props => [];
}

class GetCameraAiAlarmConfigs extends AlarmConfigEvent {
  final String cameraId;

  const GetCameraAiAlarmConfigs(this.cameraId);
}

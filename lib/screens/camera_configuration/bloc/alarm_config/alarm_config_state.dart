part of 'alarm_config_bloc.dart';

sealed class AlarmConfigState extends Equatable {
  const AlarmConfigState();

  @override
  List<Object> get props => [];
}

final class AlarmConfigInitial extends AlarmConfigState {}

final class AlarmConfigLoading extends AlarmConfigState {}

final class AlarmConfigLoaded extends AlarmConfigState {
  final List<CameraAlarmConfig> alarmConfigs;

  const AlarmConfigLoaded({required this.alarmConfigs});

  @override
  List<Object> get props => [alarmConfigs];
}

final class AlarmConfigError extends AlarmConfigState {
  final String message;

  const AlarmConfigError({required this.message});
}

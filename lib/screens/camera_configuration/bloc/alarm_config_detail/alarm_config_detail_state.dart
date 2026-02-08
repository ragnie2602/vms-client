part of 'alarm_config_detail_bloc.dart';

sealed class AlarmConfigDetailState extends BaseState {
  const AlarmConfigDetailState();

  @override
  List<Object> get props => [];
}

final class AlarmConfigDetailInitial extends AlarmConfigDetailState {
  @override
  StateType get type => StateType.initial;
}

final class AlarmConfigDetailLoading extends AlarmConfigDetailState {
  @override
  StateType get type => StateType.loading;
}

final class AlarmConfigDetailLoaded extends AlarmConfigDetailState {
  final AIAlarmConfig alarmConfig;
  const AlarmConfigDetailLoaded({required this.alarmConfig});

  @override
  List<Object> get props => [alarmConfig];
  @override
  StateType get type => StateType.success;
}

final class AlarmConfigDetailError extends AlarmConfigDetailState {
  final String message;
  const AlarmConfigDetailError(this.message);

  @override
  StateType get type => StateType.failure;
  @override
  String get errorMsg => message;
}

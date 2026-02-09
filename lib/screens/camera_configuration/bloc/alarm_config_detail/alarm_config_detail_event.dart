part of 'alarm_config_detail_bloc.dart';

sealed class AlarmConfigDetailEvent extends BaseEvent {
  const AlarmConfigDetailEvent();

  @override
  List<Object> get props => [];
}

class GetAlarmConfigDetail extends AlarmConfigDetailEvent {}

class ValidateAlarmConfig extends AlarmConfigDetailEvent {
  final bool? force;
  const ValidateAlarmConfig({this.force});
}

class SaveAlarmConfig extends AlarmConfigDetailEvent {
  final Function(String)? onFailure;
  final Function(int)? onSuccess;
  const SaveAlarmConfig({this.onFailure, this.onSuccess});
}

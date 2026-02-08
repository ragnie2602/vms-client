part of 'alarm_config_detail_bloc.dart';

sealed class AlarmConfigDetailEvent extends BaseEvent {
  const AlarmConfigDetailEvent();

  @override
  List<Object> get props => [];
}

class GetAlarmConfigDetail extends AlarmConfigDetailEvent {
  final String cameraId;
  final String type;
  final int status;
  const GetAlarmConfigDetail({required this.cameraId, required this.type, required this.status});
}

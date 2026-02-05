import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';

class DetectEvent extends BaseEvent {
  const DetectEvent();
}

class DetectInitial extends DetectEvent {
  const DetectInitial();
}

class DetectOnReceiveEvent extends DetectEvent {
  final ReceiveEventEntity event;
  const DetectOnReceiveEvent(this.event);
  @override
  List<Object?> get props => [event];
}

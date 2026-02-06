import 'package:equatable/equatable.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';

enum DetectStatus { initial, loading, success, failure }

class DetectState extends Equatable {
  final DetectStatus status;
  final String errorMessage;
  final List<TypeEventDetectEntity> typeEvents;
  final List<ReceiveEventEntity> receiveEvents;
  // final List<ReceiveEventEntity> selectorEvents;

  const DetectState({
    this.status = DetectStatus.initial,
    this.errorMessage = '',
    this.typeEvents = const [],
    this.receiveEvents = const [],
  });

  DetectState copyWith({
    DetectStatus? status,
    String? errorMessage,
    List<TypeEventDetectEntity>? typeEvents,
    List<ReceiveEventEntity>? receiveEvents,
  }) {
    return DetectState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      typeEvents: typeEvents ?? this.typeEvents,
      receiveEvents: receiveEvents ?? this.receiveEvents,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, typeEvents, receiveEvents];
}

import 'package:vms_flutter_client/core/base_bloc.dart';

import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';

class DetectState extends BaseState {
  const DetectState();
}

class DetectLoading extends DetectState {
  const DetectLoading();
}

class DetectSuccess extends DetectState {
  final List<TypeEventDetectEntity> typeEvents;
  final List<ReceiveEventEntity> receiveEvents;
  const DetectSuccess({
    required this.typeEvents,
    this.receiveEvents = const [],
  });
  @override
  StateType get type => StateType.success;
  @override
  List<Object?> get props => [typeEvents, receiveEvents];

  DetectSuccess copyWith({
    List<TypeEventDetectEntity>? typeEvents,
    List<ReceiveEventEntity>? receiveEvents,
  }) {
    return DetectSuccess(
      typeEvents: typeEvents ?? this.typeEvents,
      receiveEvents: receiveEvents ?? this.receiveEvents,
    );
  }
}

class DetectFailure extends DetectState {
  final String errorMessage;
  const DetectFailure({required this.errorMessage});

  @override
  StateType get type => StateType.failure;
  @override
  List<Object?> get props => [errorMessage];
}

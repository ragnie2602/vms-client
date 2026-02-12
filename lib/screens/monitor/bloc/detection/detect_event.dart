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

class FilterEventsByViewingCameras extends DetectEvent {
  final List<List<int>> viewingCameraIds;
  const FilterEventsByViewingCameras(this.viewingCameraIds);
  @override
  List<Object?> get props => [viewingCameraIds];
}

class UpdateFilterTypes extends DetectEvent {
  final List<int> selectedTypes;
  const UpdateFilterTypes(this.selectedTypes);
  @override
  List<Object?> get props => [selectedTypes];
}

class UpdateTabIndex extends DetectEvent {
  final int tabIndex;
  final List<List<int>>? viewingCameraIds;
  const UpdateTabIndex(this.tabIndex, {this.viewingCameraIds});
  @override
  List<Object?> get props => [tabIndex, viewingCameraIds];
}

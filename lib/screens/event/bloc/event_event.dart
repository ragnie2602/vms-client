part of 'event_bloc.dart';

class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object?> get props => [];
}

class GetAllEventType extends EventEvent {}

class GetEventDetail extends EventEvent {
  final int eventId;

  const GetEventDetail({required this.eventId});

  @override
  List<Object?> get props => [eventId];
}

class SearchEvent extends EventEvent {
  final int page;
  final int pageSize;
  final DateTime? startTime;
  final DateTime? endTime;
  final List<String>? eventType;
  final List<String>? cameraIds;
  final List<CameraEntity> cameras;

  const SearchEvent({
    this.page = 1,
    this.pageSize = 20,
    this.startTime,
    this.endTime,
    this.eventType,
    this.cameraIds,
    required this.cameras,
  });

  @override
  List<Object?> get props => [page, pageSize, startTime, endTime, eventType, cameraIds];
}

class ExportEventList extends EventEvent {
  final String cameraGroupName;
  final List<String>? cameraIds;
  final List<CameraEntity> cameras;
  final DateTime? endTime;
  final List<String>? eventType;
  final DateTime? startTime;

  const ExportEventList({
    required this.cameraGroupName,
    required this.cameras,
    this.startTime,
    this.endTime,
    this.eventType,
    this.cameraIds,
  });

  @override
  List<Object?> get props => [cameraGroupName, cameras, startTime, endTime, eventType, cameraIds];
}

class SaveImage extends EventEvent {
  final EventEntity event;

  const SaveImage(this.event);

  @override
  List<Object?> get props => [event];
}

class UpdateEvent extends EventEvent {
  final int eventId;
  final String description;

  const UpdateEvent({required this.eventId, required this.description});

  @override
  List<Object?> get props => [eventId, description];
}

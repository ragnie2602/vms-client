part of 'event_bloc.dart';

class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object?> get props => [];
}

class GetAllEventType extends EventEvent {}

class SearchEvent extends EventEvent {
  final int page;
  final int pageSize;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? eventType;
  final List<String>? cameraIds;

  const SearchEvent({
    this.page = 1,
    this.pageSize = 20,
    this.startTime,
    this.endTime,
    this.eventType,
    this.cameraIds,
  });

  @override
  List<Object?> get props => [page, pageSize, startTime, endTime, eventType, cameraIds];
}

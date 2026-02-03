part of 'event_bloc.dart';

class EventState extends Equatable {
  const EventState();

  @override
  List<Object?> get props => [];
}

class ExportEventLoading extends EventState {
  const ExportEventLoading();
}

class ExportEventSuccess extends EventState {
  final String filePath;

  const ExportEventSuccess(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class ExportEventFailure extends EventState {
  final String message;

  const ExportEventFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class GetAllEventTypeSuccess extends EventState {
  final List<EventType> eventTypes;

  const GetAllEventTypeSuccess(this.eventTypes);
}

class GetAllEventTypeFailure extends EventState {
  final String message;

  const GetAllEventTypeFailure(this.message);
}

class GettingAllEventType extends EventState {
  const GettingAllEventType();
}

class GettingEventDetail extends EventState {
  const GettingEventDetail();
}

class EventDetailSuccess extends EventState {
  final EventEntity event;

  const EventDetailSuccess(this.event);
}

class EventDetailFailure extends EventState {
  final String message;

  const EventDetailFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchEventSuccess extends EventState {
  final List<EventEntity> events;
  final int totalCount;
  final int page;
  final int pageSize;

  const SearchEventSuccess({
    required this.events,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  });

  @override
  List<Object?> get props => [events, totalCount, page, pageSize];
}

class SearchEventFailure extends EventState {
  final String message;

  const SearchEventFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchingEvent extends EventState {
  const SearchingEvent();
}

class UpdatingEvent extends EventState {
  const UpdatingEvent();
}

class UpdateEventSuccess extends EventState {
  final EventEntity event;

  const UpdateEventSuccess(this.event);

  @override
  List<Object?> get props => [event];
}

class UpdateEventFailure extends EventState {
  final String message;
  const UpdateEventFailure(this.message);
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';

import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_use_case.dart';
import '../../../domain/entities/event/event_type.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final IEventRepository eventRepository;

  final SearchEventUseCase searchEventUseCase;

  EventBloc(this.eventRepository, this.searchEventUseCase) : super(const EventState()) {
    on<GetAllEventType>(_onGetAllEventType);

    on<SearchEvent>(_onSearch);
  }

  FutureOr<void> _onSearch(SearchEvent event, Emitter<EventState> emit) async {
    emit(const SearchingEvent());

    final res = await searchEventUseCase.execute(
      SearchEventInput(
        page: event.page,
        pageSize: event.pageSize,
        startTime: event.startTime,
        endTime: event.endTime,
        cameraIds: event.cameraIds,
        eventTypes: event.eventType != null ? [event.eventType!] : null,
      ),
    );

    if (res.errorMsg == null) {
      emit(
        SearchEventSuccess(
          events: res.events.content,
          totalCount: res.events.totalElements,
          page: event.page,
          pageSize: res.events.pageSize,
        ),
      );
    } else {
      emit(SearchEventFailure(res.errorMsg!));
    }
  }

  FutureOr<void> _onGetAllEventType(GetAllEventType event, Emitter<EventState> emit) async {
    emit(const GettingAllEventType());

    final res = await eventRepository.getAllEventType();
    res.fold(
      (onFailure) {
        emit(GetAllEventTypeFailure(onFailure.parseMessage()));
      },
      (onSuccess) {
        emit(GetAllEventTypeSuccess(onSuccess));
      },
    );
  }
}

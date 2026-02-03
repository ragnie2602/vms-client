import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';

import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/usecases/event/export_event_usecase.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_use_case.dart';
import '../../../domain/entities/event/event_type.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final IEventRepository eventRepository;

  final SearchEventUseCase searchEventUseCase;
  final ExportEventUseCase exportEventUseCase;

  EventBloc(this.eventRepository, this.searchEventUseCase, this.exportEventUseCase)
    : super(const EventState()) {
    on<GetAllEventType>(_onGetAllEventType);

    on<SearchEvent>(_onSearch);
    on<ExportEventList>(_onExportEventList);
  }

  FutureOr<void> _onExportEventList(ExportEventList event, Emitter<EventState> emit) async {
    emit(const ExportEventLoading());

    final res = await exportEventUseCase.execute(
      ExportEventInput(
        events: event.events,
        cameraGroupName: event.cameraGroupName,
        cameras: event.cameras,
      ),
    );

    if (res.errorMsg == null) {
      emit(ExportEventSuccess(res.filePath));
    } else {
      emit(ExportEventFailure(res.errorMsg!));
    }
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
        eventTypes: event.eventType,
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

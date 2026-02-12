import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';

class DetectBloc extends Bloc<DetectEvent, DetectState> {
  final IDetectRepository detectRepository;
  StreamSubscription? _subscription;

  DetectBloc(this.detectRepository) : super(const DetectState()) {
    on<DetectInitial>(_onDetectInitial);
    on<DetectOnReceiveEvent>(_onDetectOnReceiveEvent);
    on<FilterEventsByViewingCameras>(_onFilterEventsByViewingCameras);
    on<UpdateFilterTypes>(_onUpdateFilterTypes);
    on<UpdateTabIndex>(_onUpdateTabIndex);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onDetectInitial(DetectInitial event, Emitter<DetectState> emit) async {
    emit(state.copyWith(status: DetectStatus.loading));

    // step1: Load danh sách loại sự kiện
    final result = await detectRepository.getListTypeEventDetect();
    result.fold(
      (failure) {
        emit(state.copyWith(status: DetectStatus.failure, errorMessage: failure.toString()));
      },
      (typeEvents) {
        emit(state.copyWith(status: DetectStatus.success, typeEvents: typeEvents));
      },
    );
    // step 2: Lắng nghe sự kiện từ stream
    _subscription?.cancel();
    _subscription = detectRepository.receiveEventStream.listen((event) {
      add(DetectOnReceiveEvent(event));
    });
  }

  FutureOr<void> _onDetectOnReceiveEvent(DetectOnReceiveEvent event, Emitter<DetectState> emit) {
    if (state.status == DetectStatus.success) {
      final newEvents = List<ReceiveEventEntity>.from(state.receiveEvents)
        ..insert(0, event.event);
      bool? _reachedMax;

      // quá 100 cắt ở đây
      if (newEvents.length > 100) {
        newEvents.removeRange(100, newEvents.length);
        _reachedMax = true;
      }

      emit(
        state.copyWith(
          receiveEvents: newEvents,
          hasReachedMaxEvents: _reachedMax,
        ),
      );

      // Recalculate selectedEvents if filter is active
      if (state.shouldShowSelectedEvents) {
        _emitFilteredEvents(emit, newEvents);
      }
    }
  }

  FutureOr<void> _onFilterEventsByViewingCameras(
    FilterEventsByViewingCameras event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      emit(state.copyWith(viewingCameraIds: event.viewingCameraIds));
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  FutureOr<void> _onUpdateFilterTypes(UpdateFilterTypes event, Emitter<DetectState> emit) {
    if (state.status == DetectStatus.success) {
      emit(state.copyWith(selectedFilterTypes: event.selectedTypes));
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  FutureOr<void> _onUpdateTabIndex(UpdateTabIndex event, Emitter<DetectState> emit) {
    if (state.status == DetectStatus.success) {
      final newViewingCameraIds = event.viewingCameraIds ?? state.viewingCameraIds;
      emit(state.copyWith(currentTabIndex: event.tabIndex, viewingCameraIds: newViewingCameraIds));
      _emitFilteredEvents(emit, state.receiveEvents);
    }
  }

  void _emitFilteredEvents(Emitter<DetectState> emit, List<ReceiveEventEntity> sourceEvents) {
    final filteredEvents = sourceEvents.where((receiveEvent) {
      // Check camera filter (only if on "Cam đang xem" tab)
      if (state.isViewingCamTab && state.viewingCameraIds.isNotEmpty) {
        final eventCameraId = receiveEvent.cameraId;
        if (eventCameraId == null || eventCameraId.isEmpty) return false;
        final matchesCamera = state.viewingCameraIds.any(
          (viewingId) => listEquals(eventCameraId, viewingId),
        );
        if (!matchesCamera) return false;
      }

      // Check type filter (if any filter types selected)
      if (state.hasActiveFilter) {
        final eventType = receiveEvent.eventType;
        if (eventType == null) return false;
        final matchesType = state.typeEvents.any(
          (typeEvent) =>
              state.selectedFilterTypes.contains(typeEvent.type) && typeEvent.typeName == eventType,
        );
        if (!matchesType) return false;
      }

      return true;
    }).toList();

    emit(state.copyWith(selectedEvents: filteredEvents));
  }
}

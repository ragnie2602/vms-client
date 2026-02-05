import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';

class DetectBloc extends BaseBloc<DetectEvent, DetectState> {
  final IDetectRepository detectRepository;
  StreamSubscription? _subscription;

  DetectBloc(this.detectRepository) : super(const DetectState()) {
    on<DetectInitial>(_onDetectInitial);
    on<DetectOnReceiveEvent>(_onDetectOnReceiveEvent);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onDetectInitial(
    DetectInitial event,
    Emitter<DetectState> emit,
  ) async {
    emit(DetectLoading());
    // listen sự kiện qua stream
    _subscription?.cancel();
    _subscription = detectRepository.receiveEventStream.listen((event) {
      add(DetectOnReceiveEvent(event));
    });

    final result = await detectRepository.getListTypeEventDetect();
    result.fold(
      (failure) {
        emit(DetectFailure(errorMessage: failure.toString()));
      },
      (typeEvents) {
        emit(DetectSuccess(typeEvents: typeEvents));
      },
    );
  }

  FutureOr<void> _onDetectOnReceiveEvent(
    DetectOnReceiveEvent event,
    Emitter<DetectState> emit,
  ) {
    final addedEvents = ReceiveEventEntity(
      eventType: 'type',
      eventData:
          '{"imageUrl": "https://cdn2.tuoitre.vn/thumb_w/1200/471584752817336320/2024/9/12/nh-dien-thoai2-read-only-1726153896516851952373-39-0-1086-2000-crop-1726155814082959780743.jpg", "captureTime": "2026-02-04 18:00:00", "configData": [{"icon": "", "data": "Cảnh báo cháy"}]}',
    );
    if (state is DetectSuccess) {
      final currentState = state as DetectSuccess;
      final newEvents = List<ReceiveEventEntity>.from(
        currentState.receiveEvents,
      )..insert(0, event.event);
      emit(currentState.copyWith(receiveEvents:newEvents));
    }
  }
}

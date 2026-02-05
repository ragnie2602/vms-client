import 'dart:async';

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
    emit(state.copyWith(status: DetectStatus.loading));

    // step1: Load danh sách loại sự kiện
    final result = await detectRepository.getListTypeEventDetect();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: DetectStatus.failure,
            errorMessage: failure.toString(),
          ),
        );
      },
      (typeEvents) {
        emit(
          state.copyWith(status: DetectStatus.success, typeEvents: typeEvents),
        );
      },
    );
    // step 2: Lắng nghe sự kiện từ stream
    _subscription?.cancel();
    _subscription = detectRepository.receiveEventStream.listen((event) {
      add(DetectOnReceiveEvent(event));
    });
    // fake data
    // add(DetectOnReceiveEvent(ReceiveEventEntity()));
  }

  FutureOr<void> _onDetectOnReceiveEvent(
    DetectOnReceiveEvent event,
    Emitter<DetectState> emit,
  ) {
    if (state.status == DetectStatus.success) {
      final newEvents = List<ReceiveEventEntity>.from(state.receiveEvents)
        ..insert(0, event.event);
      emit(state.copyWith(receiveEvents: newEvents));
    }
  }
}

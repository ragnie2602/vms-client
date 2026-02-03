import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/base_bloc.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_event.dart';
import 'package:vms_flutter_client/screens/monitor/bloc/detection/detect_state.dart';

class DetectBloc extends BaseBloc<DetectEvent, DetectState> {
  final IDetectRepository detectRepository;
  DetectBloc(this.detectRepository) : super(const DetectState()) {
    on<DetectInitial>(_onDetectInitial);
  }

  @override
  Future<void> close() {
    // clear data
    return super.close();
  }

  FutureOr<void> _onDetectInitial(
    DetectInitial event,
    Emitter<DetectState> emit,
  ) async {
    emit(DetectLoading());
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
}

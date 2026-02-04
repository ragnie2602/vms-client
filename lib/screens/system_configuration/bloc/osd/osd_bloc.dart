import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';
import 'package:vms_flutter_client/core/utils/osd_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_use_case.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_use_case.dart';

part 'osd_event.dart';
part 'osd_state.dart';

class OsdBloc extends Bloc<OsdEvent, OsdState> {
  final SendMultiWindowEventUseCase sendMultiWindowEventUseCase;
  final SubscribeMultiWindowEventUseCase subscribeMultiWindowEventUseCase;

  StreamSubscription? _multiWindowEventSubscription;

  OsdBloc(this.sendMultiWindowEventUseCase, this.subscribeMultiWindowEventUseCase)
    : super(OsdState(OsdUtil.getOSDPositions())) {
    on<ChangeOSDPosition>(_onChangeOSDPosition);
    on<NotifyOSDPosition>(_onNotifyOSDPosition);

    registerIPCEvents();
  }

  @override
  Future<void> close() {
    _multiWindowEventSubscription?.cancel();
    return super.close();
  }

  void registerIPCEvents() {
    _multiWindowEventSubscription?.cancel();
    _multiWindowEventSubscription = subscribeMultiWindowEventUseCase
        .execute(SubscribeMultiWindowEventInput())
        .listen((output) async {
          if (output.event is MWEChangeOSDPosition) {
            add(ChangeOSDPosition((output.event as MWEChangeOSDPosition).position));
          }
        });
  }

  void _onNotifyOSDPosition(NotifyOSDPosition event, Emitter<OsdState> emit) {
    emit(OsdState(event.position));
    sendMultiWindowEventUseCase.execute(
      SendMultiWindowEventInput(
        -1,
        'change_osd_position',
        data: {'position': event.position.value},
      ),
    );
  }

  _onChangeOSDPosition(ChangeOSDPosition event, Emitter<OsdState> emit) {
    OsdUtil.saveOSDPositions(event.position);
    emit(OsdState(event.position));
  }
}

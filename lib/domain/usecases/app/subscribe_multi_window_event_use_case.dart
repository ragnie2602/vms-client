import 'dart:async';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/stream_use_case.dart';

class SubscribeMultiWindowEventUseCase
    extends StreamUseCase<SubscribeMultiWindowEventInput, SubscribeMultiWindowEventOutput> {
  @override
  Stream<SubscribeMultiWindowEventOutput> buildUseCase(SubscribeMultiWindowEventInput input) {
    final stream = StreamController<SubscribeMultiWindowEventOutput>();

    DesktopMultiWindow.setMethodHandler((call, sourceId) async {
      switch (call.method) {
        case 'close_window':
          stream.add(SubscribeMultiWindowEventOutput(MWECloseWindow(sourceId)));
          break;
        case 'sign_out':
          stream.add(SubscribeMultiWindowEventOutput(const MWESignOut()));
          break;
        default:
      }
    });

    return stream.stream;
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
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
        case 'change_setting_window':
          MultiWindowUtil.saveWindowRect(
            call.arguments['bWindowID'],
            Rect.fromLTWH(
              call.arguments['left'],
              call.arguments['top'],
              call.arguments['width'],
              call.arguments['height'],
            ),
          );
          break;
        case 'close_window':
          stream.add(SubscribeMultiWindowEventOutput(MWECloseWindow(call.arguments['windowId'])));
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

import 'dart:async';
import 'dart:ui';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/stream_use_case.dart';

class SubscribeMultiWindowEventUseCase
    extends StreamUseCase<SubscribeMultiWindowEventInput, SubscribeMultiWindowEventOutput> {
  final IAuthRepository authRepository;

  const SubscribeMultiWindowEventUseCase(this.authRepository);

  @override
  Stream<SubscribeMultiWindowEventOutput> buildUseCase(SubscribeMultiWindowEventInput input) {
    final stream = StreamController<SubscribeMultiWindowEventOutput>();

    DesktopMultiWindow.setMethodHandler((call, sourceId) async {
      switch (call.method) {
        case 'change_setting_window':
          MultiWindowUtil.saveWindowSetting(
            call.arguments['bWindowID'],
            rect: Rect.fromLTWH(
              call.arguments['left'],
              call.arguments['top'],
              call.arguments['width'] ?? 1200,
              call.arguments['height'] ?? 675,
            ),
            vmValue: call.arguments['viewMode'],
            isDefaultMode: call.arguments['isDefaultMode'],
            id: call.arguments['id'],
          );
          await MultiWindowUtil.save();
          break;
        case 'close_window':
          stream.add(SubscribeMultiWindowEventOutput(MWECloseWindow(call.arguments['windowId'])));
          break;
        case 'profile':
          AppData.instance.profile = MyProfile.fromJson(call.arguments);
          await authRepository.connectSocket(
            host: AppData.instance.profile?.host ?? '',
            port: AppData.instance.profile?.port ?? 0,
            uid: AppData.instance.profile?.uid ?? [],
            sessionId: AppData.instance.profile?.sessionId ?? [],
          );
          stream.add(SubscribeMultiWindowEventOutput(const MWEProfileReady()));
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

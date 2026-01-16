import 'dart:async';
import 'dart:ui';

import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/osd.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/user/my_profile.dart';
import 'package:vms_flutter_client/domain/i_repositories/sources.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/subscribe_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/stream_use_case.dart';

class SubscribeMultiWindowEventUseCase
    extends StreamUseCase<SubscribeMultiWindowEventInput, SubscribeMultiWindowEventOutput> {
  static final stream = StreamController<SubscribeMultiWindowEventOutput>.broadcast();
  static bool isInitialized = false; // Avoid setMethodHandler multiple times

  final IAuthRepository authRepository;

  const SubscribeMultiWindowEventUseCase(this.authRepository);

  @override
  Stream<SubscribeMultiWindowEventOutput> buildUseCase(SubscribeMultiWindowEventInput input) {
    if (Platform.isAndroid || Platform.isIOS) return const Stream.empty();

    if (!isInitialized) {
      isInitialized = true;

      DesktopMultiWindow.setMethodHandler((call, sourceId) async {
        switch (call.method) {
          case 'change_osd_position':
            stream.add(
              SubscribeMultiWindowEventOutput(
                MWEChangeOSDPosition(
                  OSDPosition.values.firstWhere((e) => e.value == call.arguments['position']),
                ),
              ),
            );
            break;
          case 'change_setting_window':
            await MultiWindowUtil.saveWindowSetting(
              call.arguments['bWindowID'],
              rect: Rect.fromLTWH(
                call.arguments['left'],
                call.arguments['top'],
                call.arguments['width'] ?? 1200,
                call.arguments['height'] ?? 675,
              ),
              vmValue: call.arguments['viewMode'],
              isDefaultMode: call.arguments['isDefaultMode'],
              id:
                  (call.arguments['id'] as List<dynamic>?)?.map((e) => e as int).toList() ??
                  <int>[],
            );
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
          case 'restore_monitor_mode':
            final viewMode = ViewMode.fromValue(call.arguments['viewMode'] ?? 1);
            final isDefaultMode = call.arguments['isDefaultMode'] ?? true;
            final id =
                (call.arguments['id'] as List<dynamic>?)?.map((e) => e as int).toList() ?? <int>[];

            stream.add(
              SubscribeMultiWindowEventOutput(MWERestoreMonitorMode(viewMode, isDefaultMode, id)),
            );
            break;
          case 'sign_out':
            stream.add(SubscribeMultiWindowEventOutput(const MWESignOut()));
            break;
          case 'sync_storage_config':
            stream.add(SubscribeMultiWindowEventOutput(const MWESyncStorageConfig()));
            break;
          default:
        }
      });
    }

    return stream.stream.asBroadcastStream();
  }
}

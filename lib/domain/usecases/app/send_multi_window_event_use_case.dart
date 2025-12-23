import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class SendMultiWindowEventUseCase
    extends FutureUseCase<SendMultiWindowEventInput, SendMultiWindowEventOutput> {
  @override
  Future<SendMultiWindowEventOutput> buildUseCase(SendMultiWindowEventInput input) async {
    if (Platform.isAndroid || Platform.isIOS) {
      return SendMultiWindowEventOutput();
    }

    switch (input.methodName) {
      case 'change_setting_window':
        final data = {
          'bWindowID': input.data?['bWindowID'],
          'left': input.data?['rect']?.left,
          'top': input.data?['rect']?.top,
          'width': input.data?['rect']?.width,
          'height': input.data?['rect']?.height,
          'viewMode': input.data?['viewMode'],
          'isDefaultMode': input.data?['isDefaultMode'],
          'id': input.data?['id'],
        };
        await DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, data);
        break;
      case 'close_window':
        final data = {'windowId': input.data?['windowId']};
        await DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, data);
        break;
      case 'profile':
        await DesktopMultiWindow.invokeMethod(
          input.targetWindowID,
          input.methodName,
          AppData.instance.profile?.toJson(),
        );
        break;
      case 'restore_monitor_mode':
        final bWindowID = input.data!['bWindowID'];
        final (_, setting) = MultiWindowUtil.getSuitableWindowSetting(suggestWindowID: bWindowID);

        await DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, {
          'viewMode': setting.viewMode.value,
          'isDefaultMode': setting.isDefaultMode,
          'id': setting.id,
        });
        break;
      case 'sign_out':
        final List<int> targetIds = [];
        if (input.targetWindowID == -1) {
          targetIds.add(0);
          targetIds.addAll(await DesktopMultiWindow.getAllSubWindowIds());
        } else {
          targetIds.add(input.targetWindowID);
        }

        for (var targetId in targetIds) {
          DesktopMultiWindow.invokeMethod(targetId, input.methodName);
        }
        break;
      case 'sync_storage_config':
        final subIds = await DesktopMultiWindow.getAllSubWindowIds();
        for (var subId in subIds) {
          DesktopMultiWindow.invokeMethod(subId, input.methodName);
        }
        break;
      default:
        DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, input.data);
    }

    return SendMultiWindowEventOutput();
  }
}

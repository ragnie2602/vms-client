import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class SendMultiWindowEventUseCase
    extends FutureUseCase<SendMultiWindowEventInput, SendMultiWindowEventOutput> {
  @override
  Future<SendMultiWindowEventOutput> buildUseCase(SendMultiWindowEventInput input) async {
    switch (input.methodName) {
      case 'change_setting_window':
        final data = {
          'bWindowID': input.data?['bWindowID'],
          'left': input.data?['rect']?.left,
          'top': input.data?['rect']?.top,
          'width': input.data?['rect']?.width,
          'height': input.data?['rect']?.height,
        };
        DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, data);
        break;
      case 'close_window':
        final data = {'windowId': input.data?['windowId']};
        DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, data);
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
      default:
        DesktopMultiWindow.invokeMethod(input.targetWindowID, input.methodName, input.data);
    }

    return SendMultiWindowEventOutput();
  }
}

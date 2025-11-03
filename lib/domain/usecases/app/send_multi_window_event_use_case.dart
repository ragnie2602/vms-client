import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/send_multi_window_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class SendMultiWindowEventUseCase
    extends FutureUseCase<SendMultiWindowEventInput, SendMultiWindowEventOutput> {
  @override
  Future<SendMultiWindowEventOutput> buildUseCase(SendMultiWindowEventInput input) async {
    final List<int> targetIds = [];
    if (input.targetWindowID == -1) {
      targetIds.add(0);
      targetIds.addAll(await DesktopMultiWindow.getAllSubWindowIds());
    } else {
      targetIds.add(input.targetWindowID);
    }

    switch (input.methodName) {
      case 'sign_out':
        for (var targetId in targetIds) {
          DesktopMultiWindow.invokeMethod(targetId, input.methodName);
        }
        break;
      default:
    }

    return SendMultiWindowEventOutput();
  }
}

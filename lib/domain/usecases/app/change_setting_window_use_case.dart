import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/domain/usecases/app/change_setting_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/change_setting_window_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';
import 'package:window_manager/window_manager.dart';

class ChangeSettingWindowUseCase
    extends FutureUseCase<ChangeSettingWindowInput, ChangeSettingWindowOutput> {
  @override
  Future<ChangeSettingWindowOutput> buildUseCase(ChangeSettingWindowInput input) async {
    final rect = await windowManager.getBounds();

    MultiWindowUtil.saveWindowRect(input.windowId, rect);

    return ChangeSettingWindowOutput();
  }
}

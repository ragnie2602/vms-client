import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateNewWindowUseCase
    extends FutureUseCase<CreateNewWindowInput, CreateNewWindowOutput> {
  @override
  Future<CreateNewWindowOutput> buildUseCase(CreateNewWindowInput input) async {
    if (Platform.isAndroid || Platform.isIOS) {
      throw Exception('Multi-window is not supported on mobile');
    }

    final setting = MultiWindowUtil.getSuitableWindowSetting(
      suggestWindowID: input.windowID,
    );

    final controller = await DesktopMultiWindow.createWindow('${setting.$1}');

    controller.setFrame(setting.$2.rect);
    controller.setTitle('VNPT Secure Vision - Cửa sổ phụ ${setting.$1}');

    return CreateNewWindowOutput(controller, setting.$1);
  }
}

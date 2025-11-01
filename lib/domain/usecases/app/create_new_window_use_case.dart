import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/core/utils/multi_window_util.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateNewWindowUseCase extends FutureUseCase<CreateNewWindowInput, CreateNewWindowOutput> {
  @override
  Future<CreateNewWindowOutput> buildUseCase(CreateNewWindowInput input) async {
    final businessID = MultiWindowUtil.getSuitableBusinessID();

    final controller = await WindowController.create(
      WindowConfiguration(arguments: jsonEncode({'businessWindowID': 'sub_window_$businessID'})),
    );
    MultiWindowUtil.systemAndBusinessMapping[controller.windowId] = businessID;

    return CreateNewWindowOutput(controller);
  }
}

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateNewWindowUseCase extends FutureUseCase<CreateNewWindowInput, CreateNewWindowOutput> {
  @override
  Future<CreateNewWindowOutput> buildUseCase(CreateNewWindowInput input) async {
    final controller = await DesktopMultiWindow.createWindow();

    return CreateNewWindowOutput(controller);
  }
}

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_input.dart';
import 'package:vms_flutter_client/domain/usecases/app/create_new_window_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateNewWindowUseCase extends FutureUseCase<CreateNewWindowInput, CreateNewWindowOutput> {
  @override
  Future<CreateNewWindowOutput> buildUseCase(CreateNewWindowInput input) async {
    final windowControllers = await WindowController.getAll();

    // Select the suitable window ID for the new window
    final existances = windowControllers.map((wc) => wc.windowId).toSet();
    int id = 1;
    while (existances.contains('sub_window_$id')) {
      id++;
    }

    // Create arguments if neccessary

    // Create new window
    final controller = await WindowController.create(WindowConfiguration(arguments: ''));

    return CreateNewWindowOutput(controller);
  }
}

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class CreateNewWindowOutput extends BaseOutput {
  final WindowController windowController;
  final int bWindowId;

  CreateNewWindowOutput(this.windowController, this.bWindowId);
}

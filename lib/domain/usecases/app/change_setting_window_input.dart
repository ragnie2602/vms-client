import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class ChangeSettingWindowInput extends BaseInput {
  final int windowId;

  const ChangeSettingWindowInput(this.windowId);
}

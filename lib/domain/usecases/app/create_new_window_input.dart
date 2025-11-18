import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class CreateNewWindowInput extends BaseInput {
  final int? windowID;

  const CreateNewWindowInput({this.windowID});
}

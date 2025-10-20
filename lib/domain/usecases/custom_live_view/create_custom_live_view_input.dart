import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class CreateCustomLiveViewInput extends BaseInput {
  final String name;
  final ViewMode base;

  const CreateCustomLiveViewInput({required this.name, required this.base});
}

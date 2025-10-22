import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class UpdateCustomLiveViewUseCaseInput extends BaseInput {
  final CustomLiveView customView;

  const UpdateCustomLiveViewUseCaseInput({required this.customView});
}

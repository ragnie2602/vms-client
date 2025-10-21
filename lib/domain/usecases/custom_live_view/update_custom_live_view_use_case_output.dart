import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class UpdateCustomLiveViewUseCaseOutput extends BaseOutput {
  final bool isSuccess;
  final String? errorMessage;

  final CustomLiveView? customView;

  const UpdateCustomLiveViewUseCaseOutput({
    required this.isSuccess,
    this.errorMessage,
    this.customView,
  });
}

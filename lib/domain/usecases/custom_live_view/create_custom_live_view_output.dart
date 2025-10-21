import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class CreateCustomLiveViewOutput extends BaseOutput {
  final CustomLiveView? customLiveView;
  final bool isSuccess;
  final String? errorMessage;

  const CreateCustomLiveViewOutput({
    this.customLiveView,
    required this.isSuccess,
    this.errorMessage,
  });
}

import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class CreateTempCustomLiveViewOutput extends BaseOutput {
  final CustomLiveView customLiveView;

  const CreateTempCustomLiveViewOutput({required this.customLiveView});
}

import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class GetListCustomLiveViewOutput extends BaseOutput {
  final List<CustomLiveView> customViews;

  final bool isSuccess;
  final String? errorMessage;

  const GetListCustomLiveViewOutput({
    required this.customViews,
    required this.isSuccess,
    required this.errorMessage,
  });
}

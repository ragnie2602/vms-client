import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class CreateTempCustomLiveViewInput extends BaseInput {
  final ViewMode newBase;
  final CustomLiveView? oldCv;

  const CreateTempCustomLiveViewInput({required this.newBase, this.oldCv});
}

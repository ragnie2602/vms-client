import 'package:vms_flutter_client/data/models/multi_window_event_model.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class SubscribeMultiWindowEventOutput extends BaseOutput {
  final MWE event;

  const SubscribeMultiWindowEventOutput(this.event);
}

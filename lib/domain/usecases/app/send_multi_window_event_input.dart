import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class SendMultiWindowEventInput extends BaseInput {
  final int targetWindowID;
  final String methodName;
  final Map<String, dynamic>? data;

  const SendMultiWindowEventInput(this.targetWindowID, this.methodName, {this.data});
}

import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/base_use_case.dart';

abstract class SyncUseCase<Input extends BaseInput, Output extends BaseOutput>
    extends BaseUseCase<Input, Output> {
  const SyncUseCase();

  Output execute(Input input) {
    try {
      Output output = buildUseCase(input);
      return output;
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/base_use_case.dart';

abstract class FutureUseCase<Input extends BaseInput, Output extends BaseOutput> extends BaseUseCase<Input, Future<Output>> {
  const FutureUseCase();

  Future<Output> execute(Input input) async {
    try {
      Output output = await buildUseCase(input);
      return output;
    } catch (e) {
      throw Exception(e);
    }
  }
}
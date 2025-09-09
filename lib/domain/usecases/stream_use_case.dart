import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/base_use_case.dart';

abstract class StreamUseCase<Input extends BaseInput, Output extends BaseOutput> 
extends BaseUseCase<Input, Stream<Output>> {
  const StreamUseCase();
  Stream<Output> execute(Input input) {
    try {
      Stream<Output> stream = buildUseCase(input);
      return stream;
    } catch (e) {
      throw Exception(e);
    }
  }
}
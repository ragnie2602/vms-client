import 'package:vms_flutter_client/domain/usecases/base_input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  const BaseUseCase();

  Output buildUseCase(Input input);
}
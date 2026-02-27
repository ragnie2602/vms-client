import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class GetObjectTypesInput extends BaseInput {
  final int page;
  final int size;

  GetObjectTypesInput({required this.page, required this.size});
}

class GetObjectTypesOutput extends BaseOutput {
  final Map<String, dynamic> data;

  GetObjectTypesOutput(this.data);
}

class GetObjectTypesUsecase
    extends FutureUseCase<GetObjectTypesInput, GetObjectTypesOutput> {
  final IObjectGroupRepository _repository;

  GetObjectTypesUsecase(this._repository);

  @override
  Future<GetObjectTypesOutput> buildUseCase(GetObjectTypesInput input) async {
    return execute(input);
  }

  @override
  Future<GetObjectTypesOutput> execute(GetObjectTypesInput input) async {
    final result = await _repository.getObjectTypes(input.page, input.size);
    return GetObjectTypesOutput(result);
  }
}

import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CreateSubjectGroupInput extends BaseInput {
  final String name;
  final int parentId;

  CreateSubjectGroupInput({required this.name, required this.parentId});
}

class CreateSubjectGroupOutput extends BaseOutput {}

class CreateSubjectGroupUsecase
    extends FutureUseCase<CreateSubjectGroupInput, CreateSubjectGroupOutput> {
  final IObjectGroupRepository _repository;

  CreateSubjectGroupUsecase(this._repository);

  @override
  Future<CreateSubjectGroupOutput> buildUseCase(
    CreateSubjectGroupInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<CreateSubjectGroupOutput> execute(
    CreateSubjectGroupInput input,
  ) async {
    await _repository.createSubjectGroup(input.name, input.parentId);
    return CreateSubjectGroupOutput();
  }
}

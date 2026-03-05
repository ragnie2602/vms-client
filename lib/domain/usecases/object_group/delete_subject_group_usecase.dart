import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class DeleteSubjectGroupInput extends BaseInput {
  final int id;

  DeleteSubjectGroupInput({required this.id});
}

class DeleteSubjectGroupOutput extends BaseOutput {}

class DeleteSubjectGroupUsecase
    extends FutureUseCase<DeleteSubjectGroupInput, DeleteSubjectGroupOutput> {
  final IObjectGroupRepository _repository;

  DeleteSubjectGroupUsecase(this._repository);

  @override
  Future<DeleteSubjectGroupOutput> buildUseCase(
    DeleteSubjectGroupInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<DeleteSubjectGroupOutput> execute(
    DeleteSubjectGroupInput input,
  ) async {
    await _repository.deleteSubjectGroup(objectGroupId: input.id);
    return DeleteSubjectGroupOutput();
  }
}

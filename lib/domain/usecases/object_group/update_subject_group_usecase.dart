import 'package:vms_flutter_client/domain/IRepositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class UpdateSubjectGroupInput extends BaseInput {
  final int id;
  final SubjectGroup request  ;

  UpdateSubjectGroupInput({
    required this.id,
    required this.request,
  });
}

class UpdateSubjectGroupOutput extends BaseOutput {}

class UpdateSubjectGroupUsecase
    extends FutureUseCase<UpdateSubjectGroupInput, UpdateSubjectGroupOutput> {
  final IObjectGroupRepository _repository;

  UpdateSubjectGroupUsecase(this._repository);

  @override
  Future<UpdateSubjectGroupOutput> buildUseCase(
    UpdateSubjectGroupInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<UpdateSubjectGroupOutput> execute(
    UpdateSubjectGroupInput input,
  ) async {
    await _repository.editObjectGroup(objectGroupId: input.id, request: input.request);
    return UpdateSubjectGroupOutput();
  }
}

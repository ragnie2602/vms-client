import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/subject_group.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class GetSubjectGroupsInput extends BaseInput {}

class GetSubjectGroupsOutput extends BaseOutput {
  final List<SubjectGroup> data;

  GetSubjectGroupsOutput(this.data);
}

class GetSubjectGroupsUsecase
    extends FutureUseCase<GetSubjectGroupsInput, GetSubjectGroupsOutput> {
  final IObjectGroupRepository _repository;

  GetSubjectGroupsUsecase(this._repository);

  @override
  Future<GetSubjectGroupsOutput> buildUseCase(
    GetSubjectGroupsInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<GetSubjectGroupsOutput> execute(GetSubjectGroupsInput input) async {
    final result = await _repository.getSubjectGroups();
    return GetSubjectGroupsOutput(result);
  }
}

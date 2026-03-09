import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/subject_group/check_subject_group_model.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class CheckSubjectGroupInput extends BaseInput {
  final int id;

  CheckSubjectGroupInput({required this.id});
}

class CheckSubjectGroupOutput extends BaseOutput {
  final Either<Failure, CheckSubjectGroupModel> data;

  CheckSubjectGroupOutput(this.data);
}

class CheckSubjectGroupUsecase
    extends FutureUseCase<CheckSubjectGroupInput, CheckSubjectGroupOutput> {
  final IObjectGroupRepository _repository;

  CheckSubjectGroupUsecase(this._repository);

  @override
  Future<CheckSubjectGroupOutput> buildUseCase(
    CheckSubjectGroupInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<CheckSubjectGroupOutput> execute(CheckSubjectGroupInput input) async {
    final result = await _repository.checkSubjectGroup(input.id);
    return CheckSubjectGroupOutput(result);
  }
}

import 'package:vms_flutter_client/domain/i_repositories/i_object_group_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class GetObjectsByTypeInput extends BaseInput {
  final int objectTypeId;
  final int page;
  final int size;
  final int subjectGroupId;
  final String? search;

  GetObjectsByTypeInput({
    required this.objectTypeId,
    required this.page,
    required this.size,
    required this.subjectGroupId,
    this.search,
  });
}

class GetObjectsByTypeOutput extends BaseOutput {
  final Map<String, dynamic> data;

  GetObjectsByTypeOutput(this.data);
}

class GetObjectsByTypeUsecase
    extends FutureUseCase<GetObjectsByTypeInput, GetObjectsByTypeOutput> {
  final IObjectGroupRepository _repository;

  GetObjectsByTypeUsecase(this._repository);

  @override
  Future<GetObjectsByTypeOutput> buildUseCase(
    GetObjectsByTypeInput input,
  ) async {
    return execute(input);
  }

  @override
  Future<GetObjectsByTypeOutput> execute(GetObjectsByTypeInput input) async {
    final result = await _repository.getObjects(
      input.objectTypeId,
      input.page,
      input.subjectGroupId,
      input.size,
      search: input.search,
    );
    return GetObjectsByTypeOutput(result);
  }
}

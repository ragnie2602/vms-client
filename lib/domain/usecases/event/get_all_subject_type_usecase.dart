import 'package:vms_flutter_client/domain/entities/subject/object_type_model.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'get_all_subject_type_input.dart';
part 'get_all_subject_type_output.dart';

class GetAllSubjectTypesUsecase
    extends FutureUseCase<GetAllSubjectTypesInput, GetAllSubjectTypesOutput> {
  final IEventRepository _eventRepository;

  const GetAllSubjectTypesUsecase(this._eventRepository);

  @override
  Future<GetAllSubjectTypesOutput> buildUseCase(GetAllSubjectTypesInput input) async {
    final result = await _eventRepository.getAllSubjectTypes();

    return result.fold(
      (failure) => throw Exception(failure),
      (subjectTypes) => GetAllSubjectTypesOutput(subjectTypes),
    );
  }
}

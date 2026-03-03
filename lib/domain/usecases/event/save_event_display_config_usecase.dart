import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'save_event_display_config_input.dart';
part 'save_event_display_config_output.dart';

class SaveEventDisplayConfigUsecase
    extends FutureUseCase<SaveEventDisplayConfigInput, SaveEventDisplayConfigOutput> {
  final IEventRepository _eventRepository;

  SaveEventDisplayConfigUsecase(this._eventRepository);

  @override
  Future<SaveEventDisplayConfigOutput> buildUseCase(SaveEventDisplayConfigInput input) async {
    final result = await _eventRepository.updateEventDisplayConfig(input.configs);

    return result.fold(
      (failure) => throw Exception(failure),
      (success) => SaveEventDisplayConfigOutput(),
    );
  }
}

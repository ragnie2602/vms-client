import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'get_event_display_config_input.dart';
part 'get_event_display_config_output.dart';

class GetEventDisplayConfigUsecase
    extends FutureUseCase<GetEventDisplayConfigInput, GetEventDisplayConfigOutput> {
  final IEventRepository _eventRepository;

  const GetEventDisplayConfigUsecase(this._eventRepository);

  @override
  Future<GetEventDisplayConfigOutput> buildUseCase(GetEventDisplayConfigInput input) async {
    final result = await _eventRepository.getEventDisplayConfig(input.eventType, input.typeConfig);

    return result.fold((failure) => throw Exception(failure), (config) {
      for (var f in config.fields) {
        if (f.fieldKey == 'cameraId') {
          f.fieldKey = 'cameraName';
          f.fieldName = 'Tên camera';
        }
      }
      int i = config.sorting.indexOf('cameraId');
      if (i != -1) config.sorting[i] = 'cameraName';

      return GetEventDisplayConfigOutput(config);
    });
  }
}

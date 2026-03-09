import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
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
    final result = await _eventRepository.getEventDisplayConfig(
      input.eventType,
      input.typeConfig,
      input.subjectTypeId,
    );

    return result.fold((failure) => throw Exception(failure), (config) {
      List<Fields> newFields = [];
      for (var f in config.fields) {
        if (f.fieldKey == 'cameraId') {
          newFields.add(f.copyWith(fieldKey: 'cameraName', fieldName: 'Tên camera'));
        } else if (f.fieldKey != 'Ảnh nhận diện khuôn mặt') {
          newFields.add(f);
        }
      }

      // FIX: Tạo list mới (Deep copy) để không ảnh hưởng đến cache
      var newSorting = List<String>.from(config.sorting);

      int i = newSorting.indexOf('cameraId');
      if (i != -1) newSorting[i] = 'cameraName';

      for (var i = newSorting.length - 1; i >= 0; i--) {
        final f = newFields.firstWhereOrNull((f) => f.fieldKey == newSorting[i]);
        if (f == null) newSorting.removeAt(i);
      }

      final newC = config.copyWith(fields: newFields, sorting: newSorting);

      return GetEventDisplayConfigOutput(newC);
    });
  }
}

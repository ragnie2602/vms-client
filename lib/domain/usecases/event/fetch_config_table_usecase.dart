import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'fetch_config_table_input.dart';
part 'fetch_config_table_output.dart';

class FetchConfigTableUsecase extends FutureUseCase<FetchConfigTableInput, FetchConfigTableOutput> {
  final IEventRepository _eventRepository;

  const FetchConfigTableUsecase(this._eventRepository);

  @override
  Future<FetchConfigTableOutput> buildUseCase(FetchConfigTableInput input) async {
    final configTable = <String, List<FieldConfigEntity>>{};

    for (var eventType in input.eventTypes) {
      final result = await _eventRepository.getEventDisplayConfig(eventType);
      result.fold(
        (failure) => throw failure,
        (success) => configTable[eventType] = success.fields ?? [],
      );
    }

    return FetchConfigTableOutput(configTable);
  }
}

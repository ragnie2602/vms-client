import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'get_event_item_display_input.dart';
part 'get_event_item_display_output.dart';

class GetEventItemDisplayUsecase
    extends FutureUseCase<GetEventItemDisplayInput, GetEventItemDisplayOutput> {
  static const Map<String, EventDisplayConfig> _eventDisplayConfigs = {};

  final IEventRepository _eventRepository;

  GetEventItemDisplayUsecase(this._eventRepository);

  @override
  Future<GetEventItemDisplayOutput> buildUseCase(GetEventItemDisplayInput input) async {
    Map<String, dynamic> raw = {};
    if (input.event.eventType == null) return GetEventItemDisplayOutput(raw);

    EventDisplayConfig? config = _eventDisplayConfigs[input.event.eventType];
    if (config == null) {
      final result = await _eventRepository.getEventDisplayConfig(input.event.eventType!, 1);
      result.fold(
        (failure) => throw failure,
        (success) => config = _eventDisplayConfigs[input.event.eventType!] = success,
      );
    }

    return GetEventItemDisplayOutput({});
  }
}

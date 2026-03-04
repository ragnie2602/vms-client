import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

part 'search_event_output.dart';

class SearchEventUseCase extends FutureUseCase<SearchEventInput, SearchEventOutput> {
  final IEventRepository eventRepository;

  SearchEventUseCase(this.eventRepository);

  @override
  Future<SearchEventOutput> buildUseCase(SearchEventInput input) async {
    List<String> cameraIds = input.cameraIds ?? input.cameras.map((e) => e.camId).toList();

    final res = await eventRepository.searchEvent(
      page: input.page,
      startTime: input.startTime != null ? input.startTime!.millisecondsSinceEpoch ~/ 1000 : null,
      endTime: input.endTime != null ? input.endTime!.millisecondsSinceEpoch ~/ 1000 : null,
      eventType: input.eventTypes,
      cameraIds: cameraIds,
      subjectName: input.subjectName,
    );

    List<EventType> eventTypes = [];

    final etRes = await eventRepository.getAllEventType();
    etRes.fold((onFailure) {}, (onSuccess) => eventTypes.addAll(onSuccess));

    return res.fold(
      (onFailure) => SearchEventOutput(Pageable.empty(), 0, errorMsg: onFailure.parseMessage()),
      (onSuccess) {
        final events = onSuccess.content;
        for (int i = 0; i < events.length; i++) {
          final event = events[i];
          final camera = input.cameras.firstWhereOrNull((c) => c.camId == event.cameraId);

          events[i].camera = camera;
          events[i].eventName = eventTypes
              .firstWhereOrNull((e) => e.eventKey == event.eventType)
              ?.name;
        }

        return SearchEventOutput(onSuccess, onSuccess.totalElements);
      },
    );
  }
}

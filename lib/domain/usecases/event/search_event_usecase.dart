import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
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
    final res = await eventRepository.searchEvent(
      page: input.page,
      startTime: input.startTime != null ? input.startTime!.millisecondsSinceEpoch ~/ 1000 : null,
      endTime: input.endTime != null ? input.endTime!.millisecondsSinceEpoch ~/ 1000 : null,
      eventType: input.eventTypes,
      cameraIds: input.cameraIds,
    );

    return res.fold(
      (onFailure) => SearchEventOutput(Pageable.empty(), 0, errorMsg: onFailure.parseMessage()),
      (onSuccess) {
        final events = onSuccess.content;
        for (int i = 0; i < events.length; i++) {
          final event = events[i];
          final camera = input.cameras.firstWhereOrNull((c) => c.camId == event.cameraId);

          events[i].camera = camera;
        }

        return SearchEventOutput(onSuccess, onSuccess.totalElements);
      },
    );
  }
}

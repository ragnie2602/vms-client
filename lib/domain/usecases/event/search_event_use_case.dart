import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_input.dart';
import 'package:vms_flutter_client/domain/usecases/event/search_event_output.dart';
import 'package:vms_flutter_client/domain/usecases/future_use_case.dart';

class SearchEventUseCase extends FutureUseCase<SearchEventInput, SearchEventOutput> {
  final IEventRepository eventRepository;

  SearchEventUseCase(this.eventRepository);

  @override
  Future<SearchEventOutput> buildUseCase(SearchEventInput input) async {
    final res = await eventRepository.searchEvent(
      page: input.page,
      startTime: input.startTime != null ? input.startTime!.millisecondsSinceEpoch ~/ 1000 : null,
      endTime: input.endTime != null ? input.endTime!.millisecondsSinceEpoch ~/ 1000 : null,
      eventType: input.eventTypes?.first,
      cameraIds: input.cameraIds?.map((e) => int.parse(e)).toList(),
    );

    return res.fold(
      (onFailure) => SearchEventOutput(Pageable.empty(), 0, errorMsg: onFailure.parseMessage()),
      (onSuccess) => SearchEventOutput(onSuccess, 0),
    );
  }
}

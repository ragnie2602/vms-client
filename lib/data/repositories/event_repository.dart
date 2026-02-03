import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/data/datasources/event_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';

class EventRepository extends BaseRepository implements IEventRepository {
  final EventService eventService;

  EventRepository(this.eventService);

  @override
  Future<Either<Failure, List<EventType>>> getAllEventType() async {
    return await catchError<List<EventType>>(() async {
      final data = await eventService.getAllEventType();
      return Right(data.map<EventType>((e) => EventType.fromJson(e)).toList());
    });
  }

  @override
  Future<Either<Failure, Pageable<EventEntity>>> searchEvent({
    int? page,
    List<String>? cameraIds,
    int? endTime,
    List<String>? eventType,
    int? startTime,
  }) async {
    return await catchError<Pageable<EventEntity>>(() async {
      final data = await eventService.searchEvent(
        cameraIds: cameraIds,
        endTime: endTime,
        eventType: eventType,
        startTime: startTime,
        page: page,
      );

      return Right(Pageable.fromJson(data, EventEntity.fromJson));
    });
  }
}

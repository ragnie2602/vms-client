import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/data/datasources/event_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_event_repository.dart';

class EventRepository extends BaseRepository implements IEventRepository {
  static final Map<(String, int), EventDisplayConfig> configTable = {};

  final EventService eventService;

  EventRepository(this.eventService);

  @override
  Future<Either<Failure, List<EventEntity>>> exportEvent(
    int? startTime,
    int? endTime,
    List<String>? eventType,
    List<String>? cameraIds,
  ) async {
    return await catchError<List<EventEntity>>(() async {
      final data = await eventService.exportEvent(
        startTime: startTime,
        endTime: endTime,
        eventType: eventType,
        cameraIds: cameraIds,
      );

      return Right(data.map<EventEntity>((e) => EventEntity.fromJson(e)).toList());
    });
  }

  @override
  Future<Either<Failure, List<EventType>>> getAllEventType() async {
    return await catchError<List<EventType>>(() async {
      final data = await eventService.getAllEventType();
      return Right(data.map<EventType>((e) => EventType.fromJson(e)).toList());
    });
  }

  @override
  Future<Either<Failure, EventEntity>> getEventDetail(int eventId) async {
    return await catchError<EventEntity>(() async {
      final data = await eventService.getEventDetail(eventId);
      return Right(EventEntity.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, EventDisplayConfig>> getEventDisplayConfig(
    String eventType,
    int typeConfig,
  ) async {
    final key = (eventType, typeConfig);
    if (configTable.containsKey(key)) return Right(configTable[key]!);

    return await catchError<EventDisplayConfig>(() async {
      final data = await eventService.getEventDisplayConfig(eventType, typeConfig);

      EventDisplayConfig config = EventDisplayConfig.fromJson(data);
      configTable[key] = config;

      return Right(EventDisplayConfig.fromJson(data));
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

  @override
  Future<Either<Failure, EventEntity>> updateEvent(int eventId, String description) async {
    return await catchError<EventEntity>(() async {
      final data = await eventService.updateEvent(eventId, description);
      return Right(EventEntity.fromJson(data));
    });
  }

  @override
  Future<Either<Failure, EventDisplayConfig>> updateEventDisplayConfig({
    required List<String> listField,
    required String eventType,
  }) async {
    return await catchError<EventDisplayConfig>(() async {
      final data = await eventService.updateEventDisplayConfig(
        listField: listField,
        eventType: eventType,
      );

      EventDisplayConfig config = EventDisplayConfig.fromJson(data);
      configTable[(eventType, config.typeConfig)] = config;

      return Right(EventDisplayConfig.fromJson(data));
    });
  }
}

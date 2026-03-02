import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';

abstract class IEventRepository {
  Future<Either<Failure, List<EventEntity>>> exportEvent(
    int? startTime,
    int? endTime,
    List<String>? eventType,
    List<String>? cameraIds,
  );

  Future<Either<Failure, List<EventType>>> getAllEventType();

  Future<Either<Failure, EventEntity>> getEventDetail(int eventId);

  Future<Either<Failure, EventDisplayConfig>> getEventDisplayConfig(
    String eventType,
    int typeConfig,
  );

  Future<Either<Failure, Pageable<EventEntity>>> searchEvent({
    int? startTime,
    int? endTime,
    List<String>? eventType,
    List<String>? cameraIds,
    int? page,
  });

  Future<Either<Failure, EventEntity>> updateEvent(int eventId, String description);

  Future<Either<Failure, EventDisplayConfig>> updateEventDisplayConfig({
    required List<String> listField,
    required String eventType,
  });
}

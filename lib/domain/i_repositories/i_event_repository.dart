import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/core/utils/pageable.dart';
import 'package:vms_flutter_client/domain/entities/event/event_entity.dart';
import 'package:vms_flutter_client/domain/entities/event/event_type.dart';

abstract class IEventRepository {
  Future<Either<Failure, List<EventType>>> getAllEventType();

  Future<Either<Failure, Pageable<EventEntity>>> searchEvent({
    int? startTime,
    int? endTime,
    int? eventType,
    List<int>? cameraIds,
    int? page,
  });
}

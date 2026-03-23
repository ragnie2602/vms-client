import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/detect_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';

class DetectRepository extends BaseRepository implements IDetectRepository {
  final DetectService service;
  const DetectRepository(this.service);
  @override
  Future<Either<Failure, List<TypeEventDetectEntity>>> getListTypeEventDetect() async {
    return await catchError<List<TypeEventDetectEntity>>(() async {
      final data = await service.getListTypeEventDetect();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, EventDisplayConfig>> getEventDisplayConfig({
    required String eventTypeName,
  }) async {
    return await catchError<EventDisplayConfig>(() async {
      final data = await service.getEventDisplayConfig(eventTypeName: eventTypeName);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, List<FieldConfigEntity>>> getListFieldAvailable() async {
    return await catchError<List<FieldConfigEntity>>(() async {
      final data = await service.getListFieldAvailable();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, EventDisplayConfig>> updateEventDisplayConfig({
    required List<String> listField,
    required String eventTypeName,
  }) async {
    return await catchError<EventDisplayConfig>(() async {
      final data = await service.updateEventDisplayConfig(
        listField: listField,
        eventTypeName: eventTypeName,
      );
      return Right(data);
    });
  }

  @override
  Stream<ReceiveEventEntity> get receiveEventStream => service.receiveEventStream;
}

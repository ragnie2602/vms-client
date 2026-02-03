import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/data/datasources/detect_service.dart';
import 'package:vms_flutter_client/data/repositories/base_repository.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';
import 'package:vms_flutter_client/domain/i_repositories/i_detect_repository.dart';

class DetectRepository extends BaseRepository implements IDetectRepository {
  final DetectService service;
  const DetectRepository(this.service);
  @override
  Future<Either<Failure, List<TypeEventDetectEntity>>>
  getListTypeEventDetect() async {
    return await catchError<List<TypeEventDetectEntity>>(() async {
      final data = await service.getListTypeEventDetect();
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, EventDisplayConfigEntity>> getEventDisplayConfig({
    required int eventTypeId,
  }) async {
    return await catchError<EventDisplayConfigEntity>(() async {
      final data = await service.getEventDisplayConfig(
        eventTypeId: eventTypeId,
      );
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
}

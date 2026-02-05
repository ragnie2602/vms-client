import 'package:vms_flutter_client/core/base_response.dart';
import 'package:vms_flutter_client/domain/entities/detect/event_display_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/field_config_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';
import 'package:vms_flutter_client/domain/entities/detect/type_event_detect_entity.dart';

abstract class IDetectRepository {
  // danh sách loại sự kiện detect
  Future<Either<Failure, List<TypeEventDetectEntity>>> getListTypeEventDetect();
  // cấu hình hiển thị của từng loại sự kiện detect
  Future<Either<Failure, EventDisplayConfigEntity>> getEventDisplayConfig({
    required int eventTypeId,
  });
  // danh sách các field có thể chọn để cấu hình hiển thị cho sự kiện
  Future<Either<Failure, List<FieldConfigEntity>>> getListFieldAvailable();
  // update cấu hình hiển thị của từng loại sự kiện detect
  Future<Either<Failure, EventDisplayConfigEntity>> updateEventDisplayConfig({
    required List<String> listField,
    required int eventTypeId,
  });
  Stream<ReceiveEventEntity> get receiveEventStream;
}

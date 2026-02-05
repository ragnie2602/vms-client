import 'package:vms_flutter_client/data/proto/models/comm.vsv.1.3.pb.dart'
    as pb;
import 'package:vms_flutter_client/domain/entities/detect/receive_event_entity.dart';

extension ReceiveEventMapper on pb.ReceiveEvent {
  ReceiveEventEntity toDomain() {
    return ReceiveEventEntity(
      eventType: eventType,
      eventData: eventData,
      cameraId: cameraId,
    );
  }
}

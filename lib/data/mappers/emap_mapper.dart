import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';
import 'package:vms_flutter_client/domain/entities/emap/emap_entity.dart';

extension EmapInfoMapper on EmapInfo {
  EmapEntity toDomain() {
    return EmapEntity(
      emapId: emapId,
      emapName: emapName,
      backgroundPath: backgroundPath,
    );
  }
}

extension EmapEntityMapper on EmapEntity {
  EmapInfo toProto() {
    return EmapInfo(
      emapId: emapId,
      emapName: emapName,
      backgroundPath: backgroundPath,
    );
  }
}

extension CameraEmapInfoMapper on CameraEmapInfo {
  CameraEmapInfoEntity toDomain() {
    return CameraEmapInfoEntity(
      cameraId: cameraId,
      typeIcon: typeIcon,
      xCoordinate: xCoordinate,
      yCoordinate: yCoordinate,
      cameraEmapInfoId: cameraEmapInfoId,
    );
  }
}

extension CameraEmapInfoEntityMapper on CameraEmapInfoEntity {
  CameraEmapInfo toProto() {
    return CameraEmapInfo(
      cameraId: cameraId,
      typeIcon: typeIcon,
      xCoordinate: xCoordinate,
      yCoordinate: yCoordinate,
      cameraEmapInfoId: cameraEmapInfoId,
    );
  }
}

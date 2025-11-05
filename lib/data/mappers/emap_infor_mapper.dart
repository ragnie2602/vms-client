import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pd;
import 'package:vms_flutter_client/domain/entities/map/camera_emap_info_entity.dart';
import 'package:vms_flutter_client/domain/entities/map/emap_infor_entity.dart';

extension EmapInforMapper on pd.EmapInfo {
  EmapInforEntity toDomain() {
    return EmapInforEntity(
      emapId: emapId,
      emapName: emapName,
      backgroundPath: backgroundPath,
    );
  }
}

extension CameraEmapInforMapper on pd.CameraEmapInfo {
  CameraEmapInfoEntity toDomain() {
    return CameraEmapInfoEntity(
      emapId: cameraEmapInfoId,
      cameraId: cameraId,
      xCoordinate: xCoordinate,
      yCoordinate: yCoordinate,
      typeIcon: typeIcon,
    );
  }
}

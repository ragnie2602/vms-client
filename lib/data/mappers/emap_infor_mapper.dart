import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pd;
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

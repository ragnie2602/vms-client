import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';

extension BaseViewMapper on pb.Base_View {
  BaseView toDomain() {
    return BaseView.fromValue(value);
  }
}

extension LiveViewPositionMapper on pb.LiveViewPosition {
  LiveViewPosition toDomain() {
    return LiveViewPosition(
      index: index,
      cameraId: cameraId,
      camera: hasCamera() ? camera.toDomain() : null,
    );
  }
}

extension CustomLiveViewMapper on pb.CustomLiveView {
  CustomLiveView toDomain() {
    return CustomLiveView(
      id: id,
      base: base.toDomain(),
      positions: postision.map((e) => e.toDomain()).toList(),
      name: name,
    );
  }
}

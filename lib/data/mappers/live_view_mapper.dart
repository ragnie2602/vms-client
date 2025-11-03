import 'package:vms_flutter_client/core/constants/scope_functions.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart' as pb;
import 'package:vms_flutter_client/domain/entities/live_view/base_view.dart';
import 'package:vms_flutter_client/domain/entities/live_view/live_view_position.dart';
import 'package:vms_flutter_client/domain/entities/live_view/custom_live_view.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';

extension BaseViewMapper on pb.Base_View {
  ViewMode toDomain() {
    return ViewMode.fromValue(value);
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

extension LiveViewPositionReverse on LiveViewPosition {
  pb.LiveViewPosition toPB() {
    return pb.LiveViewPosition(
      index: index,
      cameraId: cameraId,
      camera: null, // TODO: Convert camera to PB
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

extension CustomLiveViewReverse on CustomLiveView {
  pb.CustomLiveView toPB() {
    return pb.CustomLiveView(
      id: id,
      base: pb.Base_View.valueOf(base.value),
      postision: positions.map(
        (e) => pb.LiveViewPosition(
          index: e.index,
          cameraId: e.cameraId,
          // camera: e.camera?.let(
          //   (cam) => pb.Camera(
          //     name: cam.name,
          //     id: cam.id,
          //     camId: cam.camId,
          //     username: cam.username,
          //     password: cam.password,
          //     type: pb.Camera_Type.valueOf(cam.type.value),
          //     status: pb.Camera_Status.valueOf(cam.status.value),
          //     // streamUrl: cam.stream,
          //   ),
          // ),
        ),
      ),
      name: name,
    );
  }
}

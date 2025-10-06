import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import '../proto/models/comm.command2.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class CameraService {
  final SocketApiClient socketClient;

  const CameraService(this.socketClient);

  Future<List<CameraEntity>> getAllCamera(GetAllCamera_Request data) async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: data.writeToBuffer(),
          type: PacketType.getAllCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(GetAllCamera_Error.valueOf),
      (buffer) =>
          GetAllCamera_Reply.fromBuffer(buffer).cameras.map((e) => CameraEntity.fromPB(e)).toList(),
    );
  }

  Future<List<Camera>> getAllCamerasInGroup(GetCameraInGroup_Request data) async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: data.writeToBuffer(),
          type: PacketType.getCameraInGroup,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(GetCameraInGroup_Error.valueOf),
      (buffer) => GetCameraInGroup_Reply.fromBuffer(buffer).cameras,
    );
  }

  Future<List<CustomLiveView>> getListCustomLiveView() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: GetListCustomLiveView_Request().writeToBuffer(),
          type: PacketType.getListCustomLiveView,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => GetListCustomLiveView_Reply.fromBuffer(buffer).customs,
    );
  }
}

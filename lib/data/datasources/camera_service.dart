import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';

import '../proto/models/comm.command2.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class CameraService {
  final SocketApiClient socketClient;

  const CameraService(this.socketClient);

  Future<CheckCameraOnvif_Reply> checkCameraOnvif({
    required String xaddrs,
    required String userName,
    required String password,
    List<int>? boxId,
  }) async {
    final request = CheckCameraOnvif_Request()
      ..xaddrs = xaddrs
      ..userName = userName
      ..password = password;
    if (boxId != null) request.boxId = boxId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(Packet(id: DateTime.now().microsecondsSinceEpoch, data: request.writeToBuffer(), type: PacketType.checkCameraOnvif)),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(CheckCameraOnvif_Error.valueOf),
      (buffer) => CheckCameraOnvif_Reply.fromBuffer(buffer),
    );
  }

  Future<List<Camera>> getAllCamera({List<int>? cameraId, int? status, int? ivaType}) async {
    final request = GetAllCamera_Request();
    if (cameraId != null) request.cameraId = cameraId;
    if (status != null) request.status = GetAllCamera_Status.valueOf(status)!;
    if (ivaType != null) request.ivaType = GetAllCamera_Iva_Type.valueOf(ivaType)!;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(Packet(id: DateTime.now().microsecondsSinceEpoch, data: request.writeToBuffer(), type: PacketType.getAllCamera)),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(GetAllCamera_Error.valueOf),
      (buffer) => GetAllCamera_Reply.fromBuffer(buffer).cameras,
    );
  }

  Future<List<Camera>> getAllCamerasInGroup({required List<int> groupId}) async {
    final request = GetCameraInGroup_Request(groupId: groupId);

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(Packet(id: DateTime.now().microsecondsSinceEpoch, data: request.writeToBuffer(), type: PacketType.getCameraInGroup)),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(GetCameraInGroup_Error.valueOf),
      (buffer) => GetCameraInGroup_Reply.fromBuffer(buffer).cameras,
    );
  }
}

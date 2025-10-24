import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/utils/unique_id.dart';
import 'package:vms_flutter_client/data/mappers/camera_mapper.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/camera/add_camera.dart';

import '../proto/models/comm.command2.pb.dart';
import '../proto/models/comm.model.pb.dart';
import 'socket_api_client.dart';

class CameraService {
  final SocketApiClient socketClient;

  const CameraService(this.socketClient);

  Future<AddCameraEntity> addCameraRTSP({
    required String name,
    required String username,
    required String password,
    required String rtspUrl,
    MapLocation? location,
    List<int>? boxId,
    List<int>? groupId,
    List<String>? subStreamUrls,
  }) async {
    final request = AddCameraRTSP_Request()
      ..name = name
      ..username = username
      ..password = password
      ..rtspUrl = rtspUrl;
    if (location != null) request.location = location;
    if (boxId != null) request.boxId = boxId;
    if (groupId != null) request.groupId = groupId;
    if (subStreamUrls != null && subStreamUrls.isNotEmpty) {
      request.subStreamUrls.addAll(subStreamUrls);
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.addCameraRTSP,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(AddCameraRTSP_Error.valueOf),
      (buffer) => AddCameraRTSP_Reply.fromBuffer(buffer).toDomain(),
    );
  }

  Future<AddCameraEntity> addCameraOnVif({
    required String name,
    required String username,
    required String password,
    required String onvifDeviceIp,
    String? rtspUrl,
    String? serialNumber,
    MapLocation? location,
    List<int>? boxId,
    List<int>? groupId,
    String? urn,
    List<String>? subStreamUrls,
  }) async {
    final request = AddCameraOnVif_Request()
      ..name = name
      ..username = username
      ..password = password
      ..onvifDeviceIp = onvifDeviceIp;
    if (rtspUrl != null) request.rtspUrl = rtspUrl;
    if (serialNumber != null) request.serialNumber = serialNumber;
    if (location != null) request.location = location;
    if (boxId != null) request.boxId = boxId;
    if (groupId != null) request.groupId = groupId;
    if (urn != null) request.urn = urn;
    if (subStreamUrls != null && subStreamUrls.isNotEmpty) {
      request.subStreamUrls.addAll(subStreamUrls);
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.addCameraOnVif,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(AddCameraOnVif_Error.valueOf),
      (buffer) => AddCameraOnVif_Reply.fromBuffer(buffer).toDomain(),
    );
  }

  Future<Camera> updateCamera({
    required List<int> cameraId,
    String? name,
    String? rtspUrl,
    String? userName,
    String? password,
    String? xaddr,
    MapLocation? location,
    List<String>? subStreamUrls,
  }) async {
    final request = UpdateCamera_Request()..cameraId = cameraId;
    if (name != null) request.name = name;
    if (rtspUrl != null) request.rtspUrl = rtspUrl;
    if (userName != null) request.userName = userName;
    if (password != null) request.password = password;
    if (xaddr != null) request.xaddr = xaddr;
    if (location != null) request.location = location;
    if (subStreamUrls != null && subStreamUrls.isNotEmpty) {
      request.subStreamUrls.addAll(subStreamUrls);
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.updateCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(UpdateCamera_Error.valueOf),
      (buffer) => UpdateCamera_Reply.fromBuffer(buffer).camera,
    );
  }

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
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.checkCameraOnvif.value),
          data: request.writeToBuffer(),
          type: PacketType.checkCameraOnvif,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(CheckCameraOnvif_Error.valueOf),
      (buffer) => CheckCameraOnvif_Reply.fromBuffer(buffer),
    );
  }

  Future<List<Camera>> getAllCamera({
    List<int>? cameraId,
    int? status,
    int? ivaType,
  }) async {
    final request = GetAllCamera_Request();
    if (cameraId != null) request.cameraId = cameraId;
    if (status != null) request.status = GetAllCamera_Status.valueOf(status)!;
    if (ivaType != null) {
      request.ivaType = GetAllCamera_Iva_Type.valueOf(ivaType)!;
    }

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.getAllCamera.value),
          data: request.writeToBuffer(),
          type: PacketType.getAllCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(GetAllCamera_Error.valueOf),
      (buffer) => GetAllCamera_Reply.fromBuffer(buffer).cameras,
    );
  }

  Future<List<Camera>> getAllCamerasInGroup({
    required List<int> groupId,
  }) async {
    final request = GetCameraInGroup_Request(groupId: groupId);

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.getCameraInGroup.value),
          // id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.getCameraInGroup,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(GetCameraInGroup_Error.valueOf),
      (buffer) => GetCameraInGroup_Reply.fromBuffer(buffer).cameras,
    );
  }

  Future<List<int>> deleteCamera({required List<int> cameraId}) async {
    final request = DeleteCamera_Request()..cameraId = cameraId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.deleteCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure,
      (buffer) => DeleteCamera_Reply.fromBuffer(buffer).cameraId,
    );
  }

  Future<List<int>> shareCamera({
    required List<int> cameraId,
    required int role,
    required String accountInvite,
  }) async {
    final request = ShareCamera_Request()
      ..cameraId = cameraId
      ..role = ShareCamera_Role.valueOf(role)!
      ..accountInvite = accountInvite;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.shareCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(ShareCamera_Error.valueOf),
      (buffer) => ShareCamera_Reply.fromBuffer(buffer).cameraId,
    );
  }

  Future<CheckAccountShare_Reply> checkAccountShare({
    List<int>? cameraId,
    required String account,
    required int shareType,
    List<int>? groupId,
  }) async {
    final request = CheckAccountShare_Request()
      ..account = account
      ..shareType = CheckAccountShare_ShareType.valueOf(shareType)!;
    if (cameraId != null) request.cameraId = cameraId;
    if (groupId != null) request.groupId = groupId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.checkAccountShare,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(CheckAccountShare_Error.valueOf),
      (buffer) => CheckAccountShare_Reply.fromBuffer(buffer),
    );
  }

  Future<List<Camera>> addCameraToGroup({
    required List<List<int>> cameraIds,
    required List<int> groupId,
  }) async {
    final request = AddCameraToGroup_Request()
      ..cameraId.addAll(cameraIds)
      ..groupId = groupId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.addCameraToGroup,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(AddCameraToGroup_Error.valueOf),
      (buffer) => AddCameraToGroup_Reply.fromBuffer(buffer).camera,
    );
  }

  Future<RemoveCameraFormGroup_Reply> removeCameraFromGroup({
    required List<int> cameraIds,
    required List<int> groupId,
  }) async {
    final request = RemoveCameraFormGroup_Request()
      ..cameraId = cameraIds
      ..groupId = groupId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.removeCameraFormGroup,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(RemoveCameraFormGroup_Error.valueOf),
      (buffer) => RemoveCameraFormGroup_Reply.fromBuffer(buffer),
    );
  }

  // Future<List<InviteMessage>> listShareInviteGroup({
  //   required List<int> groupId,
  // }) async {
  //   final request = ListShareInviteGroup_Request()..groupId = groupId;

  //   final responseBuffer = await socketClient.send<List<int>>(
  //     SocketRequestPayload(
  //       Packet(
  //         id: DateTime.now().microsecondsSinceEpoch,
  //         data: request.writeToBuffer(),
  //         type: PacketType.listShareInviteGroup,
  //       ),
  //     ),
  //   );

  //   return responseBuffer.fold(
  //     (failure) =>
  //         throw failure.toMessageFailure(ListShareInviteGroup_Error.valueOf),
  //     (buffer) => ListShareInviteGroup_Reply.fromBuffer(buffer).invites,
  //   );
  // }

  Future<List<InviteMessage>> listShareCamera({
    required List<int> cameraId,
  }) async {
    final request = ListShareCamera_Request()..cameraId = cameraId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.listShareCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure,
      (buffer) => ListShareCamera_Reply.fromBuffer(buffer).sharingRecords,
    );
  }

  Future<DeleteShareCamera_Reply> deleteShareCamera({
    required List<int> cameraId,
    required String accountB,
    required List<int> shareId,
  }) async {
    final request = DeleteShareCamera_Request()
      ..cameraId = cameraId
      ..accountB = accountB
      ..shareId = shareId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: request.writeToBuffer(),
          type: PacketType.deleteShareCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) =>
          throw failure.toMessageFailure(DeleteShareCamera_Error.valueOf),
      (buffer) => DeleteShareCamera_Reply.fromBuffer(buffer),
    );
  }
}

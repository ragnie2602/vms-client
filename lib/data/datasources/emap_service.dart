import 'dart:typed_data';

import 'package:vms_flutter_client/core/app_data.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/keys.dart';
import 'package:vms_flutter_client/core/utils/unique_id.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/datasources/upload_api_client.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class EmapService {
  final SocketApiClient socketClient;
  final UploadApiClient uploadClient;

  const EmapService(this.socketClient, this.uploadClient);

  /// Post/Update Emap with background image upload (ID: 215)
  Future<EmapInfo> postEmap({
    required String emapName,
    required String imagePath,
    required Uint8List imageBytes,
    // required String serverUrl,
    List<int>? emapId,
    List<int>? userId,
  }) async {
    final profile = AppData.instance.profile;
    if (profile == null) {
      throw Exception('User not authenticated');
    }

    // Build protobuf request
    final request = PostEmap_Request()
      ..userId = profile.uid.codeUnits
      ..emapInfo = (EmapInfo()
        ..emapName = emapName
        ..backgroundPath = ""
        ..emapId = []);

    if (emapId != null && emapId.isNotEmpty) {
      request.emapInfo.emapId = emapId;
    }

    // Prepare file for upload
    final filename = _getFileName(imagePath);
    final imageFile = UploadFile(
      fieldName: filename
          .split('.')
          .first, // Filename without extension (matches iOS)
      filename: filename,
      bytes: imageBytes,
      contentType: _getImageContentType(imagePath),
    );
    String _serverUrl =
        AppData.instance.read<String>(AppKeys.SP_SERVER_KEY) ?? '';
    final responseBuffer = await uploadClient.upload(
      url: '$_serverUrl/vt/r/${PacketType.postEmap.value}',
      requestData: request.writeToBuffer(),
      files: [imageFile],
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(
        PostEmap_Error.valueOf,
        PacketType.postEmap.value,
      ),
      (buffer) => PostEmap_Reply.fromBuffer(buffer).emapInfo,
    );
  }

  /// List all Emaps (ID: 216)
  Future<List<EmapInfo>> listEmap() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.listEmap.value),
          data: ListEmap_Request().writeToBuffer(),
          type: PacketType.listEmap,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => ListEmap_Reply.fromBuffer(buffer).emapInfos,
    );
  }

  /// Remove Emap (ID: 217)
  Future<List<int>> removeEmap({required List<int> emapId}) async {
    final request = RemoveEmap_Request()..emapId = emapId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.removeEmap.value),
          data: request.writeToBuffer(),
          type: PacketType.removeEmap,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(
        RemoveEmap_Error.valueOf,
        PacketType.removeEmap.value,
      ),
      (buffer) => RemoveEmap_Reply.fromBuffer(buffer).emapId,
    );
  }

  /// List Camera Emap Info (ID: 220)
  Future<List<CameraEmapInfo>> listCameraEmapInfo({
    required List<int> emapId,
  }) async {
    final request = ListCameraEmapInfo_Request()..emapId = emapId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.listCameraEmapInfo.value),
          data: request.writeToBuffer(),
          type: PacketType.listCameraEmapInfo,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(
        ListCameraEmapInfo_Error.valueOf,
        PacketType.listCameraEmapInfo.value,
      ),
      (buffer) => ListCameraEmapInfo_Reply.fromBuffer(buffer).emapInfos,
    );
  }

  /// Add Camera to Emap (ID: 219)
  Future<CameraEmapInfo> addCameraEmapInfo({
    required List<int> emapId,
    required CameraEmapInfo info,
  }) async {
    final request = AddCameraEmapInfo_Request()
      ..emapId = emapId
      ..info = info;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.addCameraEmapInfo.value),
          data: request.writeToBuffer(),
          type: PacketType.addCameraEmapInfo,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(
        AddCameraEmapInfo_Error.valueOf,
        PacketType.addCameraEmapInfo.value,
      ),
      (buffer) => AddCameraEmapInfo_Reply.fromBuffer(buffer).info,
    );
  }

  /// Delete Camera from Emap (ID: 237)
  Future<void> deleteCameraEmapInfo({
    required List<int> emapId,
    required List<int> cameraEmapInfoId,
  }) async {
    final request = DeleteCameraEmapInfo_Request()
      ..emapId = emapId
      ..cameraEmapInfoId = cameraEmapInfoId;

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: UniqueId.getUniqueId(PacketType.deleteCameraEmapInfo.value),
          data: request.writeToBuffer(),
          type: PacketType.deleteCameraEmapInfo,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(
        DeleteCameraEmapInfo_Error.valueOf,
        PacketType.deleteCameraEmapInfo.value,
      ),
      (buffer) => DeleteCameraEmapInfo_Reply.fromBuffer(buffer),
    );
  }

  // Helper methods for file handling
  String _getFileName(String path) {
    return path.split('/').last.split('\\').last;
  }

  String _getImageContentType(String path) {
    final extension = path.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'jpe':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream';
    }
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
      (failure) => throw failure.toMessageFailure(
        GetAllCamera_Error.valueOf,
        PacketType.getAllCamera.value,
      ),
      (buffer) => GetAllCamera_Reply.fromBuffer(buffer).cameras,
    );
  }
}

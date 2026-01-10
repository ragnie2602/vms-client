import 'dart:io';

import 'package:dio/dio.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/core/constants/endpoints.dart';
import 'package:vms_flutter_client/core/utils/unique_id.dart';
import 'package:vms_flutter_client/data/datasources/http_client.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/datasources/upload_api_client.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/models/response/base_response.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class EmapService {
  final SocketApiClient socketClient;
  final UploadApiClient uploadClient;
  final HttpClient httpClient;

  const EmapService(this.socketClient, this.uploadClient, this.httpClient);

  Future postEmap({required String emapName, required File imageFile}) async {
    final raw = await httpClient.postMultipart(
      url: EndPoints.baseMap,
      data: {
        'name': emapName,
        'file': MultipartFile.fromBytes(
          imageFile.readAsBytesSync(),
          filename: imageFile.path.split('/').last.split('\\').last,
        ),
      },
    );
    final response = BaseResponse.fromJson(raw);
    if (response.code != 201) throw Exception(response.message);

    return response.data;
  }

  Future listEmap() async {
    final raw = await httpClient.get(EndPoints.baseMap);
    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  /// Remove Emap (ID: 217)
  Future removeEmap(int id) async {
    final raw = await httpClient.delete(url: '${EndPoints.baseMap}/$id');
    final response = BaseResponse.fromJson(raw);

    if (response.code != 204) throw Exception(response.message);

    return response.data;
  }

  Future editEmap({required int emapId, String? emapName, File? imageFile}) async {
    final data = <String, dynamic>{};
    if (emapName != null) data['name'] = emapName;
    if (imageFile != null) {
      data['file'] = MultipartFile.fromBytes(
        imageFile.readAsBytesSync(),
        filename: imageFile.path.split('/').last.split('\\').last,
      );
    }

    final raw = await httpClient.putMultipart(url: '${EndPoints.baseMap}/$emapId', data: data);
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  /// Add Camera to Emap (ID: 219)
  Future addCameraEmapInfo({
    required int emapId,
    required double xRatio,
    required double yRatio,
    required String camId,
  }) async {
    final raw = await httpClient.patch(
      url: '${EndPoints.baseMap}/$emapId/camera',
      data: {'xRatio': xRatio, 'yRatio': yRatio, 'cameraId': camId},
    );

    final response = BaseResponse.fromJson(raw);
    if (response.code != 200) throw Exception(response.message);

    return response.data;
  }

  /// Delete Camera from Emap (ID: 237)
  Future deleteCameraEmapInfo({required int emapId, required int cameraEmapInfoId}) async {
    final raw = httpClient.delete(url: '${EndPoints.baseMap}/$emapId/camera/$cameraEmapInfoId');
    final response = BaseResponse.fromJson(raw);

    if (response.code != 200) throw Exception(response.message);
    return response.data;
  }

  Future<List<Camera>> getAllCamera({List<int>? cameraId, int? status, int? ivaType}) async {
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
      (failure) =>
          throw failure.toMessageFailure(GetAllCamera_Error.valueOf, PacketType.getAllCamera.value),
      (buffer) => GetAllCamera_Reply.fromBuffer(buffer).cameras,
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/check_camera_onvif_model.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.vsv.1.2.pb.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

import 'socket_api_client.dart';

class ControlCameraService {
  final SocketApiClient socketClient;

  const ControlCameraService(this.socketClient);

  Future<CheckCameraOnvifModel> validateCamera() async {
    final validateCameraRequest = CheckCameraOnvif_Request();
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: validateCameraRequest.writeToBuffer(),
          type: PacketType.checkCameraOnvif,
        ),
      ),
    );
    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(CheckCameraOnvif_Error.valueOf),
      (buffer) {
        final reply = CheckCameraOnvif_Reply.fromBuffer(buffer);
        final serinumber = reply.serialNumber.isNotEmpty ? reply.serialNumber : reply.rtspUrl;

        final checkCameraOnvifModel = CheckCameraOnvifModel(
          rtspUrl: reply.rtspUrl,
          serialNumber: serinumber,
          subStreamUrl: reply.subStreamUrl,
        );

        return checkCameraOnvifModel;
      },
    );
  }

  Future<List<TagEntity>> getAllTag() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: ListTag_Request().writeToBuffer(),
          type: PacketType.getAllTag,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) =>
          ListTag_Reply.fromBuffer(buffer).tags.map((tag) => TagEntity.fromResponse(tag)).toList(),
    );
  }
}

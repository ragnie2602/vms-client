import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/check_camera_onvif_model.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';

import 'socket_api_client.dart';

class ControlCameraService {
  final SocketApiClient socketClient;

  const ControlCameraService(this.socketClient);

  Future<CheckCameraOnvifModel> validateCamera() async {
    final validateCameraRequest = CheckCameraOnvif_Request();
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(id: DateTime.now().microsecondsSinceEpoch, data: validateCameraRequest.writeToBuffer(), type: PacketType.checkCameraOnvif),
      ),
    );
    return responseBuffer.fold((failure) => throw failure.toMessageFailure(CheckCameraOnvif_Error.valueOf), (buffer) {
      final reply = CheckCameraOnvif_Reply.fromBuffer(buffer);
      final serinumber = reply.serialNumber.isNotEmpty ? reply.serialNumber : reply.rtspUrl;

      final checkCameraOnvifModel = CheckCameraOnvifModel(rtspUrl: reply.rtspUrl, serialNumber: serinumber, subStreamUrl: reply.subStreamUrl);

      return checkCameraOnvifModel;
    });
  }
}

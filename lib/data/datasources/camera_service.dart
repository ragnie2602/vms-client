import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

import 'socket_api_client.dart';

class CameraService {
  final SocketApiClient socketClient;

  const CameraService(this.socketClient);

  Future<List<CameraEntity>?> getAllCamera(GetAllCamera_Request data) async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: data.writeToBuffer(),
          type: PacketType.getAllCamera,
        ),
      ),
    );

    if (responseBuffer != null) {
      final response = GetAllCamera_Reply.fromBuffer(responseBuffer);

      return response.cameras.map((e) => CameraEntity.fromPB(e)).toList();
    }

    return null;
  }
}

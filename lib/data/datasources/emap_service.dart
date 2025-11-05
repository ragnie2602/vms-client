import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command2.pb.dart';
import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class EmapService {
  final SocketApiClient socketClient;
  const EmapService(this.socketClient);
  // get list emap
   Future<List<EmapInfo>> getListEmap() async {
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
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
}

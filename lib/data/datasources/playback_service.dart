import 'package:fixnum/fixnum.dart';
import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/models/packet.dart';

import '../proto/models/comm.command2.pb.dart';
import 'socket_api_client.dart';

class PlaybackService {
  final SocketApiClient socketClient;

  const PlaybackService(this.socketClient);

  Future<List<GetTimeShiftVideoCloudCamera_PlaybackVideo>> getTimeShiftVideoCloudCamera({
    List<int>? cameraId,
    required int currentTime,
    int timeZone = 0,
    List<List<int>>? cameraIdList,
    int?
    indexPlayback, // dùng cho màn multi playback (gọi 4 lần API cho 4 cam cùng 1 lúc)
  }) async {
    final request = GetTimeShiftVideoCloudCamera_Request(
      cameraId: cameraId,
      currentTime: Int64(currentTime),
      timeZone: timeZone,
      cameraIdList: cameraIdList,
    );

    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch + (indexPlayback ?? 0),
          data: request.writeToBuffer(),
          type: PacketType.getTimeShiftVideoCloudCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => GetTimeShiftVideoCloudCamera_Reply.fromBuffer(buffer).videos,
    );
  }
}

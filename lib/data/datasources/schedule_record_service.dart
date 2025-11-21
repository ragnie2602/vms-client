import 'package:vms_flutter_client/core/constants/api_constants.dart';
import 'package:vms_flutter_client/data/datasources/socket_api_client.dart';
import 'package:vms_flutter_client/data/mappers/schedule_mapper.dart';
import 'package:vms_flutter_client/data/models/packet.dart';
import 'package:vms_flutter_client/data/proto/models/comm.command1.pb.dart';
import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';

class ScheduleRecordService {
  final SocketApiClient socketClient;

  ScheduleRecordService(this.socketClient);
  Future<ScheduleRecordingCamera_Reply> scheduleRecording({
    List<int>? cameraId,
    RecordingEntity? record,
  }) async {
    // request
    final scheduleRequest = ScheduleRecordingCamera_Request();
    if (cameraId != null) {
      scheduleRequest.cameraId = cameraId;
    }
    if (record != null) {
      scheduleRequest.recording = record.toMapper();
    }
    final responseBuffer = await socketClient.send<List<int>>(
      SocketRequestPayload(
        Packet(
          id: DateTime.now().microsecondsSinceEpoch,
          data: scheduleRequest.writeToBuffer(),
          type: PacketType.scheduleRecordingCamera,
        ),
      ),
    );

    return responseBuffer.fold(
      (failure) => throw failure.toMessageFailure(),
      (buffer) => ScheduleRecordingCamera_Reply.fromBuffer(buffer),
    );
  }
}

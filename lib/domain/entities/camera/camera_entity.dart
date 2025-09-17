import 'package:vms_flutter_client/data/proto/models/comm.model.pb.dart';

class CameraEntity {
  final String name;
  final List<int> id;
  final String camId;
  final String username;
  final String password;
  final CameraType type;
  final Camera_Status status;
  final CameraStream stream;

  /// streamHlsUrl: http://ipcam.vivas.vn:8080/record01/EfCSykeCNyi-VwJCrB4AAg/EfCSykeCNyi-VwJCrB4AAg.m3u8
  /// streamOriginUrl: rtsp://any:1@10.3.3.162:8081/mystream7
  /// userOriginAddedUrl: rtsp://10.3.3.162:8081/mystream7
  Uri get streamUri => Uri.parse(stream.streamOriginUrl);

  // "rtsp://test:Vivas%402022@10.3.3.131:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif"
  // "rtsp://admin:Vivas%40115TDH@10.3.3.125:554/onvif/profile2/media.smp"
  // "rtsp://admin:Vivas%402022@10.3.3.129:554/cam/realmonitor?channel=1&subtype=0"

  CameraEntity({
    required this.name,
    required this.id,
    required this.camId,
    required this.username,
    required this.password,
    required this.type,
    required this.status,
    required this.stream,
  });

  factory CameraEntity.fromPB(Camera camera) {
    return CameraEntity(
      name: camera.name,
      id: camera.id,
      camId: camera.camId,
      username: camera.username,
      password: camera.password,
      type: camera.cameraType,
      status: camera.status,
      stream: camera.streamUrl,
    );
  }
}

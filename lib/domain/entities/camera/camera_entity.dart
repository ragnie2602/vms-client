import 'package:fixnum/fixnum.dart';
import 'package:vms_flutter_client/core/constants/core_types_extension.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity_onvif.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_role.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_type.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_status.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_stream.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

class CameraEntity {
  final String name;
  final List<int> id;
  final List<int>? groupOwnerId;
  final String camId;
  final String username;
  final String password;
  final String iPUrlStream;
  final Int64 timeAdded;
  final CameraType type;
  final CameraStatus status;
  final CameraStream stream;
  final CameraEntityOnvif onvif;
  final CameraRole cameraRole;
  final bool isOnline;
  final Set<TagEntity> tags;

  /// streamHlsUrl: http://ipcam.vivas.vn:8080/record01/EfCSykeCNyi-VwJCrB4AAg/EfCSykeCNyi-VwJCrB4AAg.m3u8
  /// streamOriginUrl: rtsp://any:1@10.3.3.162:8081/mystream7
  /// userOriginAddedUrl: rtsp://10.3.3.162:8081/mystream7
  Uri get mainStreamUri => parseUri(
    stream.streamLinks.firstWhereOrNull((e) => e.isMainStream)?.urlOfStream ??
        stream.streamOriginUrl,
  );
  Uri get subStreamUri => parseUri(
    stream.streamLinks.firstWhereOrNull((e) => e.nameOfStream == "SUB STREAM")?.urlOfStream ??
        stream.streamOriginUrl,
  );

  // "rtsp://test:Vivas%402022@10.3.3.131:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif"
  // "rtsp://admin:Vivas%40115TDH@10.3.3.125:554/onvif/profile2/media.smp"
  // "rtsp://admin:Vivas%402022@10.3.3.129:554/cam/realmonitor?channel=1&subtype=0"

  CameraEntity({
    required this.name,
    required this.id,
    required this.groupOwnerId,
    required this.camId,
    required this.username,
    required this.password,
    required this.iPUrlStream,
    required this.timeAdded,
    required this.type,
    required this.status,
    required this.stream,
    required this.onvif,
    required this.cameraRole,
    required this.isOnline,
    required this.tags,
  });

  Uri parseUri(String url) {
    Uri? uri = Uri.tryParse(url);
    if (uri != null) return uri;

    // rtsp://any:Vivas@123@123.25.70.15:8081/EfCaAv5el-qzFNr-TC3-SA
    final schemeSep = url.indexOf('://');
    final rest = url.substring(schemeSep + 3); // sau rtsp://

    final userInfo = rest.substring(0, rest.lastIndexOf('@')); // any:Vivas@123

    final newUrl = url.replaceFirst(userInfo, "");
    final userParts = userInfo.split(':');

    return Uri.parse(newUrl).replace(
      userInfo: "${Uri.encodeComponent(userParts[0])}:${Uri.encodeComponent(userParts[1])}}",
    );
  }
}

import 'package:vms_flutter_client/domain/entities/camera/camera_map.dart';
import 'package:vms_flutter_client/domain/entities/tag/tag_entity.dart';

enum CameraDialogMode { add, edit }

/// Các bước trong flow thêm camera
enum AddCameraStep {
  selectMode, // Chọn cách thêm: thủ công / dò tìm / file
  manualForm, // Form thêm thủ công (giữ nguyên logic hiện tại)
  discovery, // Dò tìm camera trong mạng
  importFile, // Thêm bằng file cấu hình
}

/// Data model to return from the dialog
class AddCameraPayload {
  final String name;
  final String method; // 'RTSP' hoặc 'ONVIF'
  final String rtsp;
  final String onifDeviceIp;
  final String username;
  final String password;
  final String subStream;
  final CameraMap location;
  final String xaddr;
  // final List<int> boxId;
  // final List<int> groupId;
  final List<String> subStreamUrls;
  // final String urn;
  // final String serialNumber;
  final Set<TagEntity> tags;

  const AddCameraPayload({
    required this.name,
    required this.method,
    required this.rtsp,
    required this.onifDeviceIp,
    required this.username,
    required this.password,
    required this.subStream,
    required this.location,
    required this.xaddr,
    // required this.boxId,
    // required this.groupId,
    required this.subStreamUrls,
    // required this.urn,
    // required this.serialNumber,
    required this.tags,
  });
}

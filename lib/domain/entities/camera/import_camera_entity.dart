import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/entities/camera/import_camera_cell.dart';

class ImportCameraEntity {
  final List<CameraEntity> cameras;
  final List<ImportCameraCell> cameraError;

  ImportCameraEntity({required this.cameras, required this.cameraError});
}

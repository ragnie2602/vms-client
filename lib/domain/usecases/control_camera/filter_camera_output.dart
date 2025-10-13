import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_output.dart';

class FilterCameraOutput extends BaseOutput {
  final List<CameraEntity>? listCamera;
  FilterCameraOutput({this.listCamera});
}

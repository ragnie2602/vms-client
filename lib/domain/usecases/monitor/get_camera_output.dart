part of 'get_camera_use_case.dart';

class GetCameraOutput extends BaseOutput {
  final bool isSuccess;
  final String? errMsg;
  final List<CameraEntity>? cameras;

  const GetCameraOutput({required this.isSuccess, this.cameras, this.errMsg});
}

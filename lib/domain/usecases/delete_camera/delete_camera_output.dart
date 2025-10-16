import '../base_output.dart';

class DeleteCameraOutput extends BaseOutput {
  final List<int> deletedCameraIds;
  final bool isSuccess;
  final String? errorMessage;

  const DeleteCameraOutput({required this.deletedCameraIds, required this.isSuccess, this.errorMessage});
}

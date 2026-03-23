import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';
import 'package:vms_flutter_client/domain/usecases/base_input.dart';

class SearchEventInput extends BaseInput {
  final int page;
  final int pageSize;
  final DateTime? startTime;
  final DateTime? endTime;
  final List<String>? cameraIds;
  final List<String>? eventTypes;
  final List<CameraEntity> cameras;
  final String? subjectName;

  const SearchEventInput({
    this.page = 1,
    this.pageSize = 20,
    this.startTime,
    this.endTime,
    this.cameraIds,
    this.eventTypes,
    required this.cameras,
    this.subjectName,
  });
}

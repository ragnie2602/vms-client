part of 'export_event_usecase.dart';

class ExportEventInput extends BaseInput {
  final DateTime? startTime;
  final DateTime? endTime;
  final List<String>? eventTypes;
  final List<String>? cameraIds;
  final String cameraGroupName;
  final List<CameraEntity> cameras;

  const ExportEventInput({
    required this.cameraGroupName,
    required this.cameras,
    this.cameraIds,
    this.endTime,
    this.eventTypes,
    this.startTime,
  });
}

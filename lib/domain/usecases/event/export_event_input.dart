part of 'export_event_usecase.dart';

class ExportEventInput extends BaseInput {
  final String cameraGroupName;
  final List<CameraEntity> cameras;
  final List<EventEntity> events;

  const ExportEventInput({
    required this.events,
    required this.cameraGroupName,
    required this.cameras,
  });
}

import 'package:vms_flutter_client/domain/entities/schedule/recording_entity.dart';

class CameraConfigEntity {
  final bool? nightvision;
  final int? brightness;
  final bool? flip;
  final bool? mirror;
  final RecordingEntity? recording;

  CameraConfigEntity({
    this.nightvision,
    this.brightness,
    this.flip,
    this.mirror,
    this.recording,
  });
}

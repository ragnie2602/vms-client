import 'package:vms_flutter_client/domain/entities/ai_alarm/al_alarm_enums.dart';

/// Enum cho các loại cảnh báo
enum AlertType {
  intrusion, // Xâm nhập
  crowding, // Tụ tập đông người
  phoneUsage, // Sử dụng điện thoại
  smoking, // Hút thuốc
  fire, // Cháy
  objectDetection, // Nhận diện đối tượng
  intrusionWarning, // Phát hiện người lạ
  unknown,
  ;

  factory AlertType.fromAIAlarmType(AIAlarmType type) {
    return switch (type) {
      AIAlarmType.zoneIntrusion => AlertType.intrusion,
      AIAlarmType.crowdGathering => AlertType.crowding,
      AIAlarmType.usingPhone => AlertType.phoneUsage,
      AIAlarmType.smoking => AlertType.smoking,
      AIAlarmType.fireAlarm => AlertType.fire,
      AIAlarmType.faceDetection => AlertType.objectDetection,
      AIAlarmType.intrusionWarning => AlertType.intrusionWarning,
      AIAlarmType.unknown => AlertType.unknown,
    };
  }
}

class NotificationAlertEntity {
  final String id;
  final AlertType alertType;
  final String message;
  final String categoryLabel;
  final String time;
  final String? cameraName;
  final String? cameraGroupName;

  const NotificationAlertEntity({
    required this.id,
    required this.alertType,
    required this.message,
    required this.categoryLabel,
    required this.time,
    this.cameraName,
    this.cameraGroupName,
  });
}

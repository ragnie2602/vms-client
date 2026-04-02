enum DeviceNotificationType {
  cameraOffline,
  aiBoxOffline,
}

class DeviceNotificationEntity {
  final String id;
  final DeviceNotificationType type;
  final String deviceName;
  final String? groupName;
  final String time;

  const DeviceNotificationEntity({
    required this.id,
    required this.type,
    required this.deviceName,
    this.groupName,
    required this.time,
  });
}

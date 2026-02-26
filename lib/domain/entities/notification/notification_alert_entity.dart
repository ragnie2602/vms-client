/// Enum cho các loại cảnh báo
enum AlertType {
  intrusion, // Xâm nhập
  crowding, // Tụ tập đông người
  phoneUsage, // Sử dụng điện thoại
  smoking, // Hút thuốc
  fire, // Cháy
  objectDetection, // Nhận diện đối tượng
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

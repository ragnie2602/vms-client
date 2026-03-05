class ReceiveEventEntity {
  final String? eventType;
  final Map<String, dynamic>? eventData;
  final List<int>? cameraId;

  ReceiveEventEntity({this.eventType, this.eventData, this.cameraId});

  factory ReceiveEventEntity.fromJson(Map<String, dynamic> json) {
    return ReceiveEventEntity(
      eventType: json['eventType'],
      eventData: json['eventData'],
      cameraId: json['cameraId'],
    );
  }
}

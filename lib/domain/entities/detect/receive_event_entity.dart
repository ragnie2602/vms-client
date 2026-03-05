class ReceiveEventEntity {
  final String? eventType;
  final Map<String, dynamic>? eventData;
  final List<int>? cameraId;

  const ReceiveEventEntity({this.eventType, this.eventData, this.cameraId});

  ReceiveEventEntity copyWith({
    String? eventType,
    Map<String, dynamic>? eventData,
    List<int>? cameraId,
  }) {
    return ReceiveEventEntity(
      eventType: eventType ?? this.eventType,
      eventData: eventData ?? this.eventData,
      cameraId: cameraId ?? this.cameraId,
    );
  }

  Map<String, dynamic> toJson() {
    return {'eventType': eventType, 'eventData': eventData, 'cameraId': cameraId};
  }

  factory ReceiveEventEntity.fromJson(Map<String, dynamic> json) {
    return ReceiveEventEntity(
      eventType: json['eventType'],
      eventData: Map<String, dynamic>.from(json['eventData']),
      cameraId: List<int>.from(json['cameraId']),
    );
  }
}

class EventEntity {
  int id;
  String? eventName;
  String? cameraId;
  int timeEvent;
  String? imageUrl;
  String? description;
  Map<String, dynamic>? payload;

  EventEntity({
    required this.id,
    this.eventName,
    this.cameraId,
    required this.timeEvent,
    this.imageUrl,
    this.description,
    this.payload,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'],
      eventName: json['eventName'],
      cameraId: json['cameraId'],
      timeEvent: json['timeEvent'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      payload: json['payload'],
    );
  }
}

class EventEntity {
  int id;
  String? eventName;
  int timeEvent;
  String? imageUrl;
  String? description;

  EventEntity({
    required this.id,
    this.eventName,
    required this.timeEvent,
    this.imageUrl,
    this.description,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'],
      eventName: json['eventName'],
      timeEvent: json['timeEvent'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['eventName'] = eventName;
    data['timeEvent'] = timeEvent;
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    return data;
  }
}

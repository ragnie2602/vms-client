class EventType {
  final int id;
  final String name;
  final int type;
  final String eventKey;

  const EventType({
    required this.id,
    required this.name,
    required this.type,
    required this.eventKey,
  });

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? 0,
      eventKey: json['eventType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "eventType": eventKey,
  };

  @override
  String toString() => name;
}

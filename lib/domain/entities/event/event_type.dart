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
      id: json['id'],
      name: json['name'],
      type: json['type'],
      eventKey: json['eventType'],
    );
  }

  @override
  String toString() => name;
}

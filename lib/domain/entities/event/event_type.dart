class EventType {
  final int id;
  final String name;
  final int type;

  const EventType({required this.id, required this.name, required this.type});

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(id: json['id'], name: json['name'], type: json['type']);
  }
}

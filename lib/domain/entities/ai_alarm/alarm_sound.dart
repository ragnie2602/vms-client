class AlarmSound {
  final int id;
  final String name;
  final String url;
  AlarmSound({required this.id, required this.name, required this.url});
  factory AlarmSound.fromJson(Map<String, dynamic> json) {
    return AlarmSound(id: json['id'], name: json['name'], url: json['linkSound'] ?? '');
  }
}

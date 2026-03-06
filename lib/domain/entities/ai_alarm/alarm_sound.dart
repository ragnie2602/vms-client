class AlarmSound {
  final int id;
  final String name;
  final String url;
  String? localFilePath;

  AlarmSound({required this.id, required this.name, required this.url, this.localFilePath});
  factory AlarmSound.fromJson(Map<String, dynamic> json) {
    return AlarmSound(id: json['id'], name: json['name'], url: json['linkSound'] ?? '');
  }
}

class Permissions {
  int id;
  String name;
  String description;
  String type;

  Permissions({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });

  Permissions copyWith({int? id, String? name, String? description, String? type}) {
    return Permissions(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'type': type};
  }

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
    );
  }

  @override
  String toString() {
    return description;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Permissions &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ type.hashCode;
  }
}

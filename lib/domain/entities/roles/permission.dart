class Permission {
  final String code;
  final String name;

  Permission({required this.code, required this.name});

  @override
  String toString() => '''Permission(code: $code, name: $name)''';

  Permission copyWith({String? code, String? name}) {
    return Permission(code: code ?? this.code, name: name ?? this.name);
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'name': name};
  }

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(code: json['code'], name: json['name']);
  }
}

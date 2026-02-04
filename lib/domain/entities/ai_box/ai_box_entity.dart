import 'dart:convert';

enum AiBoxStatus {
  all(-1),
  online(1),
  offline(0);

  final int value;
  const AiBoxStatus(this.value);
  static AiBoxStatus fromValue(int value) {
    return AiBoxStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => AiBoxStatus.all,
    );
  }
}

extension AiBoxStatusExtension on AiBoxStatus {
  String get displayName {
    switch (this) {
      case AiBoxStatus.all:
        return 'Tất cả trạng thái';
      case AiBoxStatus.online:
        return 'Online';
      case AiBoxStatus.offline:
        return 'Offline';
    }
  }
}

AiBoxEntity aiBoxEntityFromJson(String str) =>
    AiBoxEntity.fromJson(json.decode(str));

String aiBoxEntityToJson(AiBoxEntity data) => json.encode(data.toJson());

class AiBoxEntity {
  int? id;
  String? name;
  String? manufacturer;
  String? model;
  int? maxCamera;
  int? numberCameraUsed;
  int? status;
  String? ip;
  String? port;
  String? username;
  String? password;
  String? note;
  String? publicAddress;
  String? localAddress;

  AiBoxEntity({
    this.id,
    this.name,
    this.manufacturer,
    this.model,
    this.maxCamera,
    this.numberCameraUsed,
    this.status,
    this.ip,
    this.port,
    this.username,
    this.password,
    this.note,
    this.publicAddress,
    this.localAddress,
  });

  AiBoxEntity copyWith({
    int? id,
    String? name,
    String? manufacturer,
    String? model,
    int? maxCamera,
    int? numberCameraUsed,
    int? status,
    String? ip,
    String? port,
    String? userName,
    String? password,
    String? note,
    String? publicAddress,
    String? localAddress,
  }) => AiBoxEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    manufacturer: manufacturer ?? this.manufacturer,
    model: model ?? this.model,
    maxCamera: maxCamera ?? this.maxCamera,
    numberCameraUsed: numberCameraUsed ?? this.numberCameraUsed,
    status: status ?? this.status,
    ip: ip ?? this.ip,
    port: port ?? this.port,
    username: userName ?? this.username,
    password: password ?? this.password,
    note: note ?? this.note,
    publicAddress: publicAddress ?? this.publicAddress,
    localAddress: localAddress ?? this.localAddress,
  );

  factory AiBoxEntity.fromJson(Map<String, dynamic> json) => AiBoxEntity(
    id: json["id"],
    name: json["name"],
    manufacturer: json["manufacturer"],
    model: json["model"],
    maxCamera: json["maxCamera"],
    numberCameraUsed: json["numberCameraUsed"],
    status: json["status"],
    ip: json["ip"],
    port: json["port"],
    username: json["username"],
    password: json["password"],
    note: json["note"],
    publicAddress: json["publicAddress"],
    localAddress: json["localAddress"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "manufacturer": manufacturer,
    "model": model,
    "maxCamera": maxCamera,
    "numberCameraUsed": numberCameraUsed,
    "status": status,
    "ip": ip,
    "port": port,
    "username": username,
    "password": password,
    "note": note,
    "publicAddress": publicAddress,
    "localAddress": localAddress,
  };
}

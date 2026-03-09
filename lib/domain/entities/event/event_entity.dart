import 'package:vms_flutter_client/core/utils/date_util.dart';
import 'package:vms_flutter_client/domain/entities/camera/camera_entity.dart';

class EventEntity {
  int id;
  String? eventType;
  String? eventName;
  String? cameraId;
  DateTime timeEvent;
  String? imageUrl;
  String? description;
  Map<String, dynamic>? payload;
  CameraEntity? camera;
  int? subjectTypeId;

  EventEntity({
    required this.id,
    this.eventType,
    this.eventName,
    this.cameraId,
    required this.timeEvent,
    this.imageUrl,
    this.description,
    this.payload,
    this.subjectTypeId,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'],
      eventType: json['eventType'],
      eventName: json['eventName'],
      cameraId: json['cameraId'],
      timeEvent: DateTime.fromMillisecondsSinceEpoch(json['timeEvent'] * 1000),
      imageUrl: json['imageUrl'],
      description: json['description'],
      payload: json['payload'],
      subjectTypeId: json['subjectTypeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eventType': eventType,
      'eventName': eventName,
      'cameraId': cameraId,
      'timeEvent': timeEvent.format("HH:mm dd/MM/yyyy"),
      'imageUrl': imageUrl,
      'description': description,
      'payload': payload,
      'cameraName': camera?.name,
      'subjectTypeId': subjectTypeId,
    };
  }
}

import 'package:vms_flutter_client/core/env_service.dart';

class EmapEntity {
  final int id;
  final String name;
  final String imageUrl;
  final List<CameraEmapInfoEntity> cameraMaps;

  const EmapEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cameraMaps,
  });

  factory EmapEntity.fromJson(Map<String, dynamic> json) {
    return EmapEntity(
      id: json['id'],
      name: json['name'],
      imageUrl: '${EnvService.apiBaseUrl}${json['imageUrl']}',
      cameraMaps: json['cameraMaps']
          .map<CameraEmapInfoEntity>((e) => CameraEmapInfoEntity.fromJson(e))
          .toList(),
    );
  }
}

class CameraEmapInfoEntity {
  final int id;
  final List<int> cameraId;
  final double xRatio;
  final double yRatio;

  const CameraEmapInfoEntity({
    required this.id,
    required this.cameraId,
    required this.xRatio,
    required this.yRatio,
  });

  factory CameraEmapInfoEntity.fromJson(Map<String, dynamic> json) {
    return CameraEmapInfoEntity(
      id: json['id'],
      cameraId: (json['cameraId'] as String).codeUnits,
      xRatio: json['xratio'],
      yRatio: json['yratio'],
    );
  }
}

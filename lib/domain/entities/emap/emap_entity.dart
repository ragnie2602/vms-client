import 'package:flutter/foundation.dart';

class EmapEntity {
  final List<int> emapId;
  final String emapName;
  final String backgroundPath;

  EmapEntity({
    required this.emapId,
    required this.emapName,
    required this.backgroundPath,
  });
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is EmapEntity &&
            runtimeType == other.runtimeType &&
            listEquals(emapId, other.emapId) &&
            emapName == other.emapName &&
            backgroundPath == other.backgroundPath);
  }

  @override
  int get hashCode => Object.hash(emapId, emapName, backgroundPath);
}

class CameraEmapInfoEntity {
  final List<int> cameraId;
  final int typeIcon;
  final int xCoordinate;
  final int yCoordinate;
  final List<int> cameraEmapInfoId;

  CameraEmapInfoEntity({
    required this.cameraId,
    required this.typeIcon,
    required this.xCoordinate,
    required this.yCoordinate,
    required this.cameraEmapInfoId,
  });
}

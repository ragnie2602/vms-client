class EmapEntity {
  final List<int> emapId;
  final String emapName;
  final String backgroundPath;

  EmapEntity({
    required this.emapId,
    required this.emapName,
    required this.backgroundPath,
  });
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

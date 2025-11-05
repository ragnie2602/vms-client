class CameraEmapInfoEntity {
  final List<int> emapId;
  final List<int> cameraId;
  final int? xCoordinate;
  final int? yCoordinate;
  final int? typeIcon;
  CameraEmapInfoEntity({
    required this.emapId,
    required this.cameraId,
    this.xCoordinate,
    this.yCoordinate,
    this.typeIcon,
  });
}

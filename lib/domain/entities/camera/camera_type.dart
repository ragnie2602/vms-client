enum CameraType {
  unknow(0),
  rtsp(1),
  onvif(2),
  onehomeVnt(3),
  rtmp(4);

  final int value;

  const CameraType(this.value);

  static CameraType fromValue(int value) {
    return CameraType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => CameraType.unknow,
    );
  }
}

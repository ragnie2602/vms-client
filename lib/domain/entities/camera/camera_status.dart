enum CameraStatus {
  inactive(0),
  active(1);

  final int value;

  const CameraStatus(this.value);

  static CameraStatus fromValue(int value) {
    return CameraStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => CameraStatus.inactive,
    );
  }
}

extension CameraStatusExt on CameraStatus {
  String getName() {
    switch (this) {
      case CameraStatus.active:
        return 'Online';
      default:
        return 'Offline';
    }
  }
}

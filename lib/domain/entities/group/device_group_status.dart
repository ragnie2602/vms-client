enum DeviceGroupStatus {
  inactive(0),
  active(1);

  final int value;

  const DeviceGroupStatus(this.value);

  static DeviceGroupStatus fromValue(int value) {
    return DeviceGroupStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => DeviceGroupStatus.inactive,
    );
  }
}

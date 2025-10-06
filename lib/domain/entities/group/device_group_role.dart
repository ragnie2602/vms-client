enum DeviceGroupRole {
  full(0),
  gview(1),
  gmanager(2);

  final int value;

  const DeviceGroupRole(this.value);

  static DeviceGroupRole fromValue(int value) {
    return DeviceGroupRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => DeviceGroupRole.full,
    );
  }
}

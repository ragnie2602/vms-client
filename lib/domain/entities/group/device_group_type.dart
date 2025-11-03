enum DeviceGroupType {
  owner(0),
  shared(1),
  moved(2);

  final int value;

  const DeviceGroupType(this.value);

  static DeviceGroupType fromValue(int value) {
    return DeviceGroupType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => DeviceGroupType.owner,
    );
  }
}

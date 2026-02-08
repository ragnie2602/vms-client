enum AIAlarmType {
  zoneIntrusion('zone_intrusion'), // Cảnh báo xâm nhập
  smoking('smoking'), // Cảnh báo hút thuốc
  usingPhone('using_phone'), // Sử dụng điện thoại
  fireAlarm('fire_alarm'), // Cảnh báo cháy
  crowdGathering('crowd_gathering'), // Cảnh báo tụ tập
  unknown('unknown');

  final String key;
  const AIAlarmType(this.key);
  static AIAlarmType fromKey(String key) => AIAlarmType.values.firstWhere(
    (element) => element.key == key,
    orElse: () => AIAlarmType.unknown,
  );
}

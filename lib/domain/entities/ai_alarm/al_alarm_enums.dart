enum AIAlarmType {
  zoneIntrusion('zone_intrusion'), // Cảnh báo xâm nhập
  smoking('smoking'), // Cảnh báo hút thuốc
  usingPhone('using_phone'), // Sử dụng điện thoại
  fireAlarm('fire_alarm'), // Cảnh báo cháy
  crowdGathering('crowd_gathering'), // Cảnh báo tụ tập
  faceDetection('face_detection'), // Phát hiện khuôn mặt
  intrusionWarning('intrusion_warning'), //
  unknown('unknown');

  final String key;
  const AIAlarmType(this.key);
  static AIAlarmType fromKey(String key) => AIAlarmType.values.firstWhere(
    (element) => element.key == key,
    orElse: () => AIAlarmType.unknown,
  );
}

enum FireAlarmType {
  flameDetection(2, 'Phát hiện lửa'),
  smokeDetection(1, 'Phát hiện khói'),
  fireworkDetection(0, 'Phát hiện pháo hoa');

  final int value;
  final String label;
  const FireAlarmType(this.value, this.label);

  factory FireAlarmType.fromValue(int? value) => FireAlarmType.values.firstWhere(
    (element) => element.value == value,
    orElse: () => FireAlarmType.smokeDetection,
  );
}

enum CameraAlarmConfigType {
  zoneIntrusion('zone_intrusion'), // Cảnh báo xâm nhập
  smoking('smoking'), // Cảnh báo hút thuốc
  usingPhone('using_phone'), // Sử dụng điện thoại
  fireAlarm('fire_alarm'), // Cảnh báo cháy
  crowdGathering('crowd_gathering'), // Cảnh báo tụ tập
  unknown('unknown');

  final String key;
  const CameraAlarmConfigType(this.key);
  static CameraAlarmConfigType fromKey(String key) => CameraAlarmConfigType.values.firstWhere(
    (element) => element.key == key,
    orElse: () => CameraAlarmConfigType.unknown,
  );
}

class CameraAlarmConfig {
  final CameraAlarmConfigType type;
  final String name;
  final String description;
  final String icon;
  final int status;

  bool get isEnabled => status == 1;

  CameraAlarmConfig({
    required this.type,
    required this.name,
    required this.description,
    required this.icon,
    required this.status,
  });

  factory CameraAlarmConfig.fromJson(Map<String, dynamic> json) {
    return CameraAlarmConfig(
      type: CameraAlarmConfigType.fromKey(json['eventCode'] ?? ''),
      name: json['eventName'],
      status: json['status'],
      description: json['eventSubName'] ?? '',
      icon:
          json['icon'] ??
          '<svg width="42" height="42" viewBox="0 0 42 42" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="42" height="42" rx="8" fill="#ffe6e6"/><path clip-rule="evenodd" d="M30.05 11.89c.57.186.95.688.95 1.252v8.244c0 2.304-.897 4.504-2.48 6.208-.797.858-1.804 1.526-2.875 2.066L21.008 32l-4.646-2.34c-1.071-.541-2.08-1.208-2.878-2.068C11.9 25.888 11 23.688 11 21.381v-8.24c0-.563.38-1.065.95-1.25l8.58-2.816c.304-.1.637-.1.94 0z" stroke="#dc2626" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M21.5 16v6m-.005 3.5h.01" stroke="#dc2626" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg>',
    );
  }
}

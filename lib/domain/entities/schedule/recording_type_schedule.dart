enum RecordingTypeSchedule {
  alwaysRecord(0),
  customizeRecord(2);

  final int value;

  const RecordingTypeSchedule(this.value);

  static RecordingTypeSchedule fromValue(int value) {
    return RecordingTypeSchedule.values.firstWhere(
      (type) => type.value == value,
      orElse: () => RecordingTypeSchedule.alwaysRecord,
    );
  }
}

extension RecordingTypeScheduleExtension on RecordingTypeSchedule {
  String get displayName {
    switch (this) {
      case RecordingTypeSchedule.alwaysRecord:
        return 'Luôn ghi';
      case RecordingTypeSchedule.customizeRecord:
        return 'Tùy chọn';
    }
  }
}

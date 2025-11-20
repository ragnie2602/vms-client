enum ScheduleTimeDay {
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6),
  sunday(0);

  final int value;
  const ScheduleTimeDay(this.value);
  static ScheduleTimeDay getTypeFromValue(int value) {
    return ScheduleTimeDay.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ScheduleTimeDay.monday,
    );
  }
}

extension ScheduleTimeDayExtension on ScheduleTimeDay {
  String get displayName {
    switch (this) {
      case ScheduleTimeDay.monday:
        return 'Thứ 2';
      case ScheduleTimeDay.tuesday:
        return 'Thứ 3';
      case ScheduleTimeDay.wednesday:
        return 'Thứ 4';
      case ScheduleTimeDay.thursday:
        return 'Thứ 5';
      case ScheduleTimeDay.friday:
        return 'Thứ 6';
      case ScheduleTimeDay.saturday:
        return 'Thứ 7';
      case ScheduleTimeDay.sunday:
        return 'Chủ Nhật';
    }
  }

  int get getIndex {
    // map with row index from 0 to 6 (for gridview schedule time)
    return ScheduleTimeDay.values.indexOf(this);
  }
}

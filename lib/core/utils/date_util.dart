import 'package:intl/intl.dart';
import 'package:vms_flutter_client/core/constants/scope_functions.dart';

extension DateUtilExtension on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get startOfNextDay => DateTime(year, month, day + 1);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);
  bool get isToday =>
      DateTime.now().let((today) => year == today.year && month == today.month && day == today.day);

  DateTime get roundToSecond => DateTime(year, month, day, hour, minute, second);

  String format(String pattern, {String? locale}) {
    return DateFormat(pattern, locale).format(this);
  }

  bool isBetween(DateTime min, DateTime max, {bool equal = true}) {
    if (equal) {
      return (isAfter(min) || this == min) && (isBefore(max) || this == max);
    }

    return isAfter(min) && isBefore(max);
  }

  DateTime addIf(Duration duration, bool condition) {
    if (condition) return add(duration);
    return this;
  }

  DateTime clamp(DateTime min, DateTime max) {
    if (isBefore(min)) return min;
    if (isAfter(max)) return max;
    return this;
  }

  bool get isInCurrentMonth {
    return DateTime.now().let((today) => year == today.year && month == today.month);
  }
}

class DateUtil {
  static DateTime get startOfToday =>
      DateTime.now().let((date) => DateTime(date.year, date.month, date.day));
  static DateTime get startOfTomorrow =>
      DateTime.now().let((date) => DateTime(date.year, date.month, date.day + 1));
  static DateTime get endOfToday =>
      DateTime.now().let((date) => DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999));
}

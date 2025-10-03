import 'package:vms_flutter_client/core/constants/scope_functions.dart';

class DateUtil {
  static get startOfDay => DateTime.now().let((date) => DateTime(date.year, date.month, date.day));
  static get startOfTomorrow =>
      DateTime.now().let((date) => DateTime(date.year, date.month, date.day + 1));
  static get endOfDay =>
      DateTime.now().let((date) => DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999));
}

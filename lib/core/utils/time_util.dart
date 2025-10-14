import 'package:fixnum/fixnum.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  static String convertTime(Int64 timeMilliSecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(
      timeMilliSecond.toInt(),
    );
    String formatted = DateFormat('dd/MM/yyyy HH:mm').format(date);
    return formatted;
  }
}

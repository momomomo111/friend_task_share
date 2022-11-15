import 'package:intl/intl.dart';

class DateUtil {
  static String formatDeadline(DateTime date) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd HH:mmまで');
    return outputFormat.format(date);
  }
}

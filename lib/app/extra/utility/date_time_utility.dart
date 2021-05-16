import 'package:intl/intl.dart';

class DateTimeUtility {
  static final dateFormat     = "dd MMMM yyyy";
  static final dateTimeFormat = "dd MMMM yyyy HH:mm";

  static String getDateInterval({
    DateTime date
  }) {
    final dateText = DateFormat(dateFormat).format(date);

    return dateText;
  }

  static String getDateTimeInterval({
    DateTime date
  }) {
    final dateText = DateFormat(dateTimeFormat).format(date);

    return dateText;
  }
}
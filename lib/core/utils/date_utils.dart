import 'package:intl/intl.dart';

String formatDateTimeAsString(dynamic dateTime,
    {String dateFormat = 'yyyy-MM-dd'}) {
  try {
    if (dateTime is DateTime) {
      return DateFormat(dateFormat).format(dateTime);
    } else {
      return DateFormat(dateFormat).format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return '-';
  }
}

String formatDateTimeToDay(dynamic dateTime) =>
    formatDateTimeAsString(dateTime, dateFormat: 'EE');

String formatDateTimeToHourMinutes(dynamic dateTime) =>
    formatDateTimeAsString(dateTime, dateFormat: 'h a');

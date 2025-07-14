import 'package:intl/intl.dart';

extension StringExtensions on DateTime? {
  String format(String locale) {
    if (this == null) {
      return '';
    }
    String weekday = DateFormat.EEEE(locale).format(this!);

    String date = DateFormat('dd/MM/yyyy').format(this!);

    String time = DateFormat('hh:mma').format(this!);

    return '$weekday $date $time';
  }
}

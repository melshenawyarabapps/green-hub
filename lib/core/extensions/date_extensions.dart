import 'package:easy_localization/easy_localization.dart';
import 'package:gold/core/services/navigator/navigator_service.dart';

extension DateExtensions on DateTime? {
  String get formatDate {
    if (this == null) {
      return '';
    }
    final locale = NavigatorService.getContext!.locale.languageCode;
    String weekday = DateFormat.EEEE(locale).format(this!);

    String date = DateFormat('dd/MM/yyyy',locale).format(this!);

    String time = DateFormat('hh:mm a',locale).format(this!);

    return '$weekday $time $date';
  }
}

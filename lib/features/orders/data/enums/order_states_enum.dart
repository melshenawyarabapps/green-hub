import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';

enum OrderStatesEnum {
  pending,
  processing,
  delivered,
  cancelled,
}

extension OrderStatesEnumExtension on OrderStatesEnum {
  String get title {
    switch (this) {
      case OrderStatesEnum.pending:
        return LocaleKeys.pending.tr();
      case OrderStatesEnum.processing:
        return LocaleKeys.processing.tr();
      case OrderStatesEnum.delivered:
        return LocaleKeys.delivered.tr();
      case OrderStatesEnum.cancelled:
        return LocaleKeys.cancelled.tr();
    }
  }

  Color get color {
    switch (this) {
      case OrderStatesEnum.pending:
        return const Color(0xffFF9100);
      case OrderStatesEnum.processing:
        return const Color(0xffFF9100);
      case OrderStatesEnum.delivered:
        return const Color(0xff048372);
      case OrderStatesEnum.cancelled:
        return const Color(0xffFF0000);
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';

enum OrdersListEnum {
  precedent,
  transferInProgress,
  scheduled,
}

extension OrdersListEnumExtension on OrdersListEnum {
  String get title {
    switch (this) {
      case OrdersListEnum.precedent:
        return LocaleKeys.precedent.tr();
      case OrdersListEnum.transferInProgress:
        return LocaleKeys.transferInProgress.tr();
      case OrdersListEnum.scheduled:
        return LocaleKeys.scheduled.tr();
    }
  }

  bool get isTransferInProgress => this == OrdersListEnum.transferInProgress;
  bool get isPrecedent => this == OrdersListEnum.precedent;
  bool get isScheduled => this == OrdersListEnum.scheduled;
}

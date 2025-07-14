import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/shared/global_app_bar.dart';
import 'package:gold/core/shared/header_widget.dart';
import 'package:gold/core/shared/list_view_widget.dart';
import 'package:gold/translations/locale_keys.g.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalAppBar(type: CurrencyType.gold),
        8.verticalSpace,
        Text(LocaleKeys.pricesWithoutTax.tr()),
        12.verticalSpace,
        HeaderWidget(
          titles: [
            LocaleKeys.gold.tr(),
            'by${AppConfig.instance.currentFlavor.capitalizeFirst}'.tr(),
            LocaleKeys.byDollar.tr(),
            LocaleKeys.change.tr(),
          ],
        ),
        ListViewWidget(type: CurrencyType.gold),
      ],
    );
  }
}

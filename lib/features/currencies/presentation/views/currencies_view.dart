import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/shared/global_app_bar.dart';
import 'package:gold/core/shared/header_widget.dart';
import 'package:gold/core/shared/list_view_widget.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';
import 'package:gold/translations/locale_keys.g.dart';

class CurrenciesView extends StatefulWidget {
  const CurrenciesView({super.key});

  @override
  State<CurrenciesView> createState() => _CurrenciesViewState();
}

class _CurrenciesViewState extends State<CurrenciesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BaseController>().getData(CurrencyType.currencies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalAppBar(type: CurrencyType.currencies),
        8.verticalSpace,
        HeaderWidget(
          titles: [
            LocaleKeys.theCurrency.tr(),
            '${LocaleKeys.theCurrency.tr()} = ${LocaleKeys.howMuch.tr()} ${AppConfig.instance.currentFlavor.tr()}',
            '${AppConfig.instance.currentFlavor.tr()} = ${LocaleKeys.howMuch.tr()} ${LocaleKeys.currency.tr()}',
          ],
        ),
        ListViewWidget(type: CurrencyType.currencies),
      ],
    );
  }
}

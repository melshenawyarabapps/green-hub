import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/date_extensions.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';
import 'package:gold/translations/locale_keys.g.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.type, this.isCalculator = false});

  final CurrencyType type;
  final bool isCalculator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${type.name}${isCalculator ? 'Calculator' : 'Price'}In${AppConfig.instance.currentFlavor.capitalizeFirst}'
              .tr(),
        ),
        4.verticalSpace,
        BlocSelector<BaseController, BaseState, String>(
          selector:
              (state) =>
                  state.lastUpdates[type] ??
                  DateTime.now().format,
          builder: (_, lastUpdate) {
            return Text(
              '${LocaleKeys.lastUpdate.tr()}$lastUpdate',
              style: Theme.of(context).textTheme.bodyMedium,
            );
          },
        ),
      ],
    );
  }
}

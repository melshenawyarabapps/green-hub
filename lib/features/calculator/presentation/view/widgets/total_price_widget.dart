import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/translations/locale_keys.g.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  ${LocaleKeys.totalPrice.tr()}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CalculatorController, CalculatorState, String>(
              selector: (state) => state.calculatorModel?.totalPrice ?? '00.0',
              builder: (context, totalPrice) {
                return Text(
                  totalPrice.formatNumber,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: FontSizes.instance.s20,
                  ),
                );
              },
            ),
          ],
        ),
        16.verticalSpace,
      ],
    );
  }
}

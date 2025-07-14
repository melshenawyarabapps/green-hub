import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/translations/locale_keys.g.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.totalPrice});
final String totalPrice;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  ${LocaleKeys.totalPrice.tr()}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              totalPrice,
              style: Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(fontSize: FontSizes.instance.s20),
            ),
          ],
        ),
        16.verticalSpace,
      ],
    );
  }
}

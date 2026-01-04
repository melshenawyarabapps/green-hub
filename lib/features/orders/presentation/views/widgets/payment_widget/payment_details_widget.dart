import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../../generated/assets.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.paymentDetails.tr(),
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppLightColors.greyColor2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPriceRow(
                context: context,
                title: LocaleKeys.serviceCost.tr(),
                value: '25',
              ),
              _buildPriceRow(
                context: context,
                title: LocaleKeys.valueAddedTax.tr(),
                value: '10',
                isPercent: true,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppLightColors.greyColor2,
                  border: Border(
                    top: BorderSide(
                      color: AppLightColors.greyColor5,
                    ),
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.r),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.totalPrice,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 16,
                        color: context.textTheme.displayLarge?.color,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '55',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        color: context.theme.primaryColor,
                      ),
                    ),
                    CustomSvgBuilder(
                      path: Assets.svgsSaudiRiyalSymbol,
                      height: 12.h,
                      width: 10.w,
                      color: context.theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow({
    required BuildContext context,
    required String title,
    required String value,
    bool isPercent = false,
  }) {
    return Padding(
      padding: AppPadding.hvPadding(
        vertical: 7.h,
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.displayLarge,
          ),
          Spacer(),
          Text(
            value,
            style: context.textTheme.headlineSmall,
          ),
          if (isPercent)
            Text(
              '%',
              style: context.textTheme.headlineSmall,
            )
          else
            CustomSvgBuilder(
              path: Assets.svgsSaudiRiyalSymbol,
              height: 12.h,
              width: 10.w,
              color: context.textTheme.displayLarge?.color,
            ),
        ],
      ),
    );
  }
}

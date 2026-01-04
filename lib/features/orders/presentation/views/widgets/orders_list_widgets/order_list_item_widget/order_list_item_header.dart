import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/features/orders/data/enums/order_states_enum.dart';
import 'package:greenhub/generated/assets.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

class OrderListItemHeader extends StatelessWidget {
  const OrderListItemHeader({super.key, required this.orderState});

  final OrderStatesEnum orderState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppLightColors.greyColor2,
          child: const CustomSvgBuilder(
            path: Assets.svgsOrderPackageIc,
            width: 16,
            height: 16,
          ),
        ),
        8.horizontalSpace,
        Row(
          children: [
            Text(
              '${LocaleKeys.orderNumber.tr()}: ',
              style: context.textTheme.labelSmall?.copyWith(
                color: AppLightColors.greyColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '#SH1234',
              style: context.primaryTextTheme.titleMedium?.copyWith(
                color: AppLightColors.primaryColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: orderState.color.withValues(
              alpha: 0.1,
            ),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            spacing: 4.w,
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: orderState.color,
                child: Icon(
                  Icons.check,
                  size: 8.r,
                  fontWeight: FontWeight.w800,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
              Text(
                orderState.title,
                style: context.textTheme.labelSmall?.copyWith(
                  color: orderState.color,
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

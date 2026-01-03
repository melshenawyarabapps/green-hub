import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';

import '../../../../../../generated/assets.dart';

class PaymentWayesWidget extends StatelessWidget {
  const PaymentWayesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.paymentWay.tr(),
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppLightColors.greyColor2,
            borderRadius: BorderRadius.circular(250.r),
          ),
          child: Row(
            children: [
              Image.asset(Assets.imagesMockPaymentImg, width: 25.w, height: 20.h),
              Text(
                'بطاقة مدى',
                style: context.primaryTextTheme.titleMedium,
              ),
              const Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.theme.primaryColor,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Text(
                  LocaleKeys.change.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.theme.primaryColor,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

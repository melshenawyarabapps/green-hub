import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class HomeWalletWidget extends StatelessWidget {
  const HomeWalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        vertical: 18.h,
        horizontal: 24.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffEDF6F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            child: CustomSvgBuilder(
              path: Assets.svgsWallet,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.totalCurrentBalance.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(fontSize: 12),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text('2,500', style: context.textTheme.bodyMedium),
                    4.horizontalSpace,
                    CustomSvgBuilder(
                      path: Assets.svgsSaudiRiyalSymbol,
                      color: context.theme.primaryColor,
                      height: 14,
                      width: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          4.horizontalSpace,
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: context.theme.disabledColor,
          ),
        ],
      ),
    );
  }
}

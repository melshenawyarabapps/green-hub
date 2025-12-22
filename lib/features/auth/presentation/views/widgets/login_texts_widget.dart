import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/font_sizes.dart';

class LoginTextsWidget extends StatelessWidget {
  const LoginTextsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 375.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: LocaleKeys.loginNowAndStart.tr(),
              style: textTheme.titleLarge?.copyWith(fontSize: FontSizes.s30),
              children: [
                TextSpan(
                  text: LocaleKeys.deliveryAuthLandingTitle2.tr(),

                  style: textTheme.bodyLarge?.copyWith(fontSize: FontSizes.s30),
                ),
              ],
            ),
          ),
          8.verticalSpace,
          Text(
            LocaleKeys.loginToViewOrders.tr(),
            style: textTheme.titleLarge?.copyWith(fontSize: FontSizes.s16),
          ),
        ],
      ),
    );
  }
}

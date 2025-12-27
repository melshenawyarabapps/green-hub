import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';

class LoginTextsWidget extends StatelessWidget {
  const LoginTextsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // i want to split ShipHub from loginToStart text
    final ordinaryText = LocaleKeys.loginToStart.tr().replaceFirst(
      'ShipHub',
      '',
    );
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
          14.verticalSpace,
          Padding(
            padding: AppPadding.horizontalPadding(20.w),
            child: context.isUser ? RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: ordinaryText,
                style: textTheme.titleLarge?.copyWith(fontSize: FontSizes.s16),
                children: [
                  TextSpan(
                    text: 'ShipHub',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: FontSizes.s16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ) : Text(
              LocaleKeys.loginToViewOrders.tr(),
              style: textTheme.titleLarge?.copyWith(fontSize: FontSizes.s16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.imagesAuth, fit: BoxFit.fill),
          ),
          Padding(
            padding: AppPadding.horizontalPadding(AppPadding.p20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: theme.textTheme.titleLarge,
                    children: [
                      TextSpan(text: LocaleKeys.authLandingTitle11.tr()),
                      TextSpan(
                        text: LocaleKeys.authLandingTitle12.tr(),
                        style: theme.textTheme.bodyLarge,
                      ),
                      TextSpan(text: "،"),

                      TextSpan(text: "\n"),
                      TextSpan(
                        text: LocaleKeys.authLandingTitle13.tr(),
                        style: theme.textTheme.bodyLarge,
                      ),
                      TextSpan(text: LocaleKeys.authLandingTitle14.tr()),
                    ],
                  ),
                ),

                12.verticalSpace,

                Text(
                  LocaleKeys.authLandingSubtitle.tr(),
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: FontSizes.s16,
                  ),
                  textAlign: TextAlign.center,
                ),
                32.verticalSpace,
                AppElevatedButton(
                  title: LocaleKeys.loginAction.tr(),
                  onPressed: () {
                    context.pushNamed(AppRoutes.loginView);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.havePreviousAccount.tr(),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: FontSizes.s16,
                      ),
                    ),
                    AppTextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.registerView);
                      },
                      title: LocaleKeys.createAccount.tr(),
                    ),
                  ],
                ),
                12.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

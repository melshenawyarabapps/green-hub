import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Assets.imagesBoarding1, // Placeholder
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:
                      decorations?.mainDecoration.gradient?.colors ??
                      [
                        const Color(0xFF00A67E).withValues(alpha: 0.8),
                        const Color(0xFF00A67E).withValues(alpha: 0.6),
                      ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Content
          Padding(
            padding: AppPadding.horizontalPadding(AppPadding.p24),
            child: Column(
              children: [
                const Spacer(flex: 2), // Push content down
                // Title
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: LocaleKeys.authLandingTitle11.tr()),
                      TextSpan(text: " "),
                      TextSpan(
                        text: LocaleKeys.authLandingTitle12.tr(),
                        style: const TextStyle(
                          color: Color(0xFFCDFF05),
                        ), // Yellowish
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: LocaleKeys.authLandingTitle13.tr(),
                        style: const TextStyle(color: Color(0xFFCDFF05)),
                      ),
                    ],
                  ),
                ),

                16.verticalSpace,

                // Subtitle
                Text(
                  LocaleKeys.authLandingSubtitle.tr(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),

                const Spacer(flex: 1),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: AppElevatedButton(
                    title: LocaleKeys.loginAction.tr(),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.loginView);
                    },
                    backgroundColor: const Color(
                      0xFF00897B,
                    ), // Darker green button? Or usage of Theme
                  ),
                ),

                24.verticalSpace,

                // create Account Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.havePreviousAccount.tr(),
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.registerView);
                      },
                      child: Text(
                        LocaleKeys.createAccount.tr(), // "Inshaa Hisab"
                        style: TextStyle(
                          color: const Color(0xFFCDFF05),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                48.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/navigator/navigator_service.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/app_styles.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/edit_phone_bottom_sheet.dart';
import 'package:pinput/pinput.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: 800.h,
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            const Positioned.fill(child: AppGradientWidget()),
            SafeArea(
              child: Padding(
                padding: AppPadding.onlyPadding(top: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SvgPicture.asset(Assets.svgsWhiteLogo)],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 672.h,
                width: 375.w,
                decoration: decorations?.borderWhite20Decoration,
                padding: AppPadding.onlyPadding(top: AppPadding.p12),
                margin: AppPadding.onlyPadding(bottom: context.bottomPadding),
                child: Container(
                  height: 660.h,
                  width: 375.w,
                  padding: AppPadding.horizontalPadding(AppPadding.p20),
                  decoration: decorations?.borderWhiteDecoration,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        48.verticalSpace,
                        SvgPicture.asset(Assets.svgsCode),
                        24.verticalSpace,
                        Text(
                          LocaleKeys.verificationCode.tr(),
                          style: textTheme.bodyMedium,
                        ),
                        16.verticalSpace,
                        Text(
                          LocaleKeys.verificationCodeDescription.tr(),
                          style: textTheme.displayMedium,
                        ),
                        32.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.ifCodeNotReceived.tr(),
                              style: textTheme.displayLarge,
                            ),
                            AppTextButton.primary(
                              title: LocaleKeys.resendCode.tr(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2:33',
                              style: textTheme.displayLarge?.copyWith(
                                fontSize: FontSizes.s20,
                                fontWeight: FontWeights.regular,
                              ),
                            ),
                          ],
                        ),
                        16.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Pinput(
                              length: 4,
                              mainAxisAlignment: MainAxisAlignment.center,
                              separatorBuilder: (_) => 16.horizontalSpace,
                              keyboardType: TextInputType.number,

                              defaultPinTheme: PinTheme(
                                textStyle: AppStyles.getBoldStyle(
                                  color: AppLightColors.primaryColor,
                                  fontSize: FontSizes.s24,
                                ),
                                height: 56.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.all(AppRadius.r12),
                                  color: AppLightColors.greyColor2,
                                ),
                                margin: AppPadding.zero,
                                padding: AppPadding.zero,
                              ),
                              submittedPinTheme: PinTheme(
                                textStyle: AppStyles.getBoldStyle(
                                  color: AppLightColors.primaryColor,
                                  fontSize: FontSizes.s24,
                                ),
                                height: 56.h,
                                width: 56.w,
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.all(AppRadius.r12),
                                  color: AppLightColors.primaryColor12,
                                ),
                                margin: AppPadding.zero,
                                padding: AppPadding.zero,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.youNeedChangePhone.tr(),
                              style: textTheme.displayLarge,
                            ),
                            AppTextButton.primary(
                              title: LocaleKeys.changePhone.tr(),
                              onPressed: () {
                                EditPhoneBottomSheet.show(context);
                              },
                            ),
                          ],
                        ),
                        32.verticalSpace,
                        AppElevatedButton(
                          title: LocaleKeys.loginAction.tr(),
                          onPressed: () async {
                            final isUser =
                                AppConfig.instance.currentFlavor.isUser;
                            SuccessBottomSheet.show(
                              context,
                              title: LocaleKeys.loginSuccessfully.tr(),
                              subTitle:
                                  isUser
                                      ? LocaleKeys.loginSuccessfullyDescription
                                          .tr()
                                      : LocaleKeys
                                          .loginSuccessfullyDescriptionDelivery
                                          .tr(),
                            ).then((_) {
                              if (isUser) {
                                context.pushNamedAndRemoveUntil(
                                  AppRoutes.navigationView,
                                );
                              } else {
                                context.pushReplacementNamed(
                                  AppRoutes.faceIdView,
                                );
                              }
                            });
                          },
                        ),
                        16.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTextButton.black(
                              title: LocaleKeys.returnToLogin.tr(),
                              onPressed: () {
                                context.pop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

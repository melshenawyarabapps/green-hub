import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/navigator/navigator_service.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/face_id_bottom_sheet.dart';

class FaceIdView extends StatelessWidget {
  const FaceIdView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();
    final textTheme = theme.textTheme;

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
                child: Container(
                  height: 660.h,
                  width: 375.w,
                  padding: AppPadding.horizontalPadding(AppPadding.p20),
                  decoration: decorations?.borderWhiteDecoration,
                  margin: AppPadding.onlyPadding(bottom: context.bottomPadding),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          48.verticalSpace,
                          Text(
                            LocaleKeys.enterData.tr(),
                            style: textTheme.bodyMedium,
                          ),
                          32.verticalSpace,
                          AppTextFormField(
                            hintText: LocaleKeys.idNumber.tr(),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              final validator = value.validateText;
                              if (validator != null) {
                                return validator.tr();
                              }
                              return null;
                            },
                          ),
                          24.verticalSpace,
                          AppTextFormField(
                            onTap: () async{
                              await FaceIdBottomSheet.show(context);
                              await SuccessBottomSheet.show(
                                context,
                                title: LocaleKeys.addedSuccessfully.tr(),
                                subTitle:
                                LocaleKeys.loginSuccessfullyDescriptionDelivery.tr(),
                              );
                              context.pushNamedAndRemoveUntil(
                                AppRoutes.navigationView,
                              );
                            },
                            hintText: LocaleKeys.verifyFace.tr(),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.svgsSFaceId,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
                            keyboardType: TextInputType.text,
                            enabled: false,
                            validator: (value) {
                              final validator = value.validateText;
                              if (validator != null) {
                                return validator.tr();
                              }
                              return null;
                            },
                          ),
                          288.verticalSpace,
                          AppElevatedButton(
                            title: LocaleKeys.loginAction.tr(),
                            onPressed: () {
                              context.pushNamedAndRemoveUntil(
                                AppRoutes.navigationView,
                              );
                            },
                          ),
                          8.verticalSpace,
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
                          16.verticalSpace,
                        ],
                      ),
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

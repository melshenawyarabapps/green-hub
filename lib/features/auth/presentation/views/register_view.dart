import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';
import 'package:greenhub/core/widgets/upload_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        child: const _RegisterViewBody(),
      ),
    );
  }
}

class _RegisterViewBody extends HookWidget {
  const _RegisterViewBody();

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);

    final theme = Theme.of(context);
    final decorations = theme.extension<AppDecorations>();
    final textTheme = theme.textTheme;
    final isUser = AppConfig.instance.currentFlavor.isUser;
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
                  mainAxisAlignment:
                      isUser
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                  children: [
                    if (isUser) SvgPicture.asset(Assets.svgsWhiteLogo),

                    if (!isUser) ...[
                      Padding(
                        padding: AppPadding.onlyPadding(start: AppPadding.p16),
                        child: AppBackButton(),
                      ),
                      Text(
                        LocaleKeys.setupProfile.tr(),
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeights.bold,
                          fontSize: FontSizes.s24,
                        ),
                      ),
                      16.horizontalSpace,
                    ],
                  ],
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
                          if (isUser) ...[
                            48.verticalSpace,
                            Text(
                              LocaleKeys.createAccount.tr(),
                              style: textTheme.bodyMedium,
                            ),
                            32.verticalSpace,
                          ] else
                            12.verticalSpace,
                          AppTextFormField(
                            hintText: LocaleKeys.fullName.tr(),
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.svgsProfile,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
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
                            hintText: LocaleKeys.phoneNumber.tr(),
                            prefixIcon: const CountryWidget(),
                            keyboardType: TextInputType.number,
                            maxLength: 9,
                            prefixWidth: 90.w,
                            validator: (value) {
                              final validator = value.validateNumber;
                              if (validator != null) {
                                return validator.tr();
                              }
                              return null;
                            },
                          ),
                          24.verticalSpace,
                          if (isUser) ...[
                            AppTextFormField(
                              hintText: LocaleKeys.email.tr(),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsSmsTracking,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ],
                              ),
                              keyboardType: TextInputType.emailAddress,
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
                              hintText: LocaleKeys.favDestinations.tr(),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsLocation,
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                ],
                              ),
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsArrowDown,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ],
                              ),
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
                            Row(
                              children: [
                                AppSelectButton(
                                  value: isSelected.value,
                                  onChanged: (value) {
                                    isSelected.value = value ?? false;
                                  },
                                ),
                                8.horizontalSpace,
                                Text(
                                  LocaleKeys.agreeTerms.tr(),
                                  style: textTheme.displaySmall,
                                ),
                              ],
                            ),

                            120.verticalSpace,
                          ] else ...[
                            AppTextFormField(
                              hintText: LocaleKeys.dateBirth.tr(),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsCalendar,
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                ],
                              ),

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
                              hintText: LocaleKeys.nationality.tr(),
                              prefixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.iconsSa,
                                    width: 41.w,
                                    height: 26.h,
                                  ),
                                ],
                              ),

                              keyboardType: TextInputType.text,
                              validator: (value) {
                                final validator = value.validateText;
                                if (validator != null) {
                                  return validator.tr();
                                }
                                return null;
                              },
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsArrowDown,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ],
                              ),
                            ),
                            24.verticalSpace,
                            AppTextFormField(
                              hintText: LocaleKeys.carType.tr(),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                final validator = value.validateText;
                                if (validator != null) {
                                  return validator.tr();
                                }
                                return null;
                              },
                              suffixIcon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.svgsArrowDown,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ],
                              ),
                            ),
                            24.verticalSpace,
                            AppTextFormField(
                              hintText: LocaleKeys.numbers.tr(),
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
                            UploadWidget(title: LocaleKeys.carsRegister.tr()),
                            24.verticalSpace,
                            UploadWidget(
                              title: LocaleKeys.registerPhoto.tr(),
                              isChoose: true,
                            ),
                            24.verticalSpace,
                            UploadWidget(title: LocaleKeys.carsPhoto.tr()),
                            24.verticalSpace,
                            UploadWidget(title: LocaleKeys.driverPhoto.tr()),
                            24.verticalSpace,
                            UploadWidget(title: LocaleKeys.iqamaPhoto.tr()),
                            24.verticalSpace,
                            UploadWidget(title: LocaleKeys.facePhoto.tr()),
                            24.verticalSpace,
                            AppTextFormField(
                              hintText: LocaleKeys.iban.tr(),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                final validator = value.validateText;
                                if (validator != null) {
                                  return validator.tr();
                                }
                                return null;
                              },
                            ),
                            32.verticalSpace,
                          ],
                          AppElevatedButton(
                            title:
                                isUser
                                    ? LocaleKeys.saveData.tr()
                                    : LocaleKeys.next.tr(),
                            onPressed: () async {
                              if (isUser) {
                                context.pushNamedAndRemoveUntil(
                                  AppRoutes.navigationView,
                                );
                              } else {
                                await SuccessBottomSheet.show(
                                  context,
                                  title: LocaleKeys.registerSuccessfully.tr(),
                                  subTitle:
                                      LocaleKeys.registerSuccessfullyDescription
                                          .tr(),
                                );
                                context.pushNamedAndRemoveUntil(
                                  AppRoutes.navigationView,
                                );
                              }
                            },
                          ),
                          24.verticalSpace,
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

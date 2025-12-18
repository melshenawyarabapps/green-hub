import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/services/di/di.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.success) {
            _showStatusDialog(context, isSuccess: true);
          } else if (state.status == RegisterStatus.failure) {
            _showStatusDialog(
              context,
              isSuccess: false,
              message: state.errorMessage,
            );
          }
        },
        child: const _RegisterViewBody(),
      ),
    );
  }

  void _showStatusDialog(
    BuildContext context, {
    required bool isSuccess,
    String? message,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isSuccess
                              ? const Color(0xFFE8F5E9)
                              : const Color(0xFFFFEBEE),
                    ),
                    child: Icon(
                      isSuccess ? Icons.check : Icons.close,
                      color: isSuccess ? Colors.green : Colors.red,
                      size: 40.sp,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    isSuccess
                        ? LocaleKeys.accountCreatedSuccess.tr()
                        : LocaleKeys.createAccountFailed.tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    isSuccess
                        ? LocaleKeys.readyToStart.tr()
                        : (message ?? LocaleKeys.createAccountFailedDesc.tr()),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  24.verticalSpace,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      title:
                          isSuccess
                              ? LocaleKeys.loginAction.tr()
                              : LocaleKeys.tryAgain.tr(),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (isSuccess) {
                          // Navigate to Login or Home
                          Navigator.of(context).pop(); // Perform back to login
                        }
                      },
                    ),
                  ),
                  if (!isSuccess)
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          LocaleKeys.back.tr(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                ],
              ),
            ),
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

    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            height: 800.h,
            width: 375.w,
            padding: AppPadding.onlyPadding(top: context.topPadding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: decorations?.mainDecoration.gradient?.colors ?? [],
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
              ),
            ),
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(Assets.svgsWhiteLogo),
          ),
          Container(
            height: 672.h,
            width: 375.w,
            decoration: decorations?.borderWhite20Decoration,
            padding: AppPadding.onlyPadding(top: AppPadding.p12),
            child: Container(
              height: 660.h,
              width: 375.w,
              padding: AppPadding.horizontalPadding(AppPadding.p20),
              decoration: decorations?.borderWhiteDecoration,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    48.verticalSpace,
                    Text(
                      LocaleKeys.createAccount.tr(),
                      style: textTheme.bodyMedium,
                    ),
                    32.verticalSpace,
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
                        Text(
                          LocaleKeys.agreeTerms.tr(),
                          style: textTheme.displaySmall,
                        ),
                      ],
                    ),

                    120.verticalSpace,
                    AppElevatedButton(
                      title: LocaleKeys.saveData.tr(),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

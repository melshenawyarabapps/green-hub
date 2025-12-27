import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';

class UserFormFields extends HookWidget {
  const UserFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}


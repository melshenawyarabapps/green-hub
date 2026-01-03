import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';
import 'package:greenhub/core/widgets/upload_widget.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';

class DeliveryFormFields extends StatelessWidget {
  const DeliveryFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          controller: cubit.nameController,
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
          controller: cubit.phoneController,
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
          controller: cubit.emailController,
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
          controller: cubit.nationalIdController,
          hintText: LocaleKeys.idNumber.tr(),
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
          keyboardType: TextInputType.number,
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
          controller: cubit.licenseNumberController,
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
        AppTextFormField(
          controller: cubit.licenseExpiryController,
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
        UploadWidget(title: LocaleKeys.facePhoto.tr()),
        24.verticalSpace,
        UploadWidget(title: LocaleKeys.driverPhoto.tr()),
        24.verticalSpace,
        UploadWidget(title: LocaleKeys.iqamaPhoto.tr()),
      ],
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';

class AppPhoneTextField extends StatelessWidget {
  const AppPhoneTextField({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
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
    );
  }
}

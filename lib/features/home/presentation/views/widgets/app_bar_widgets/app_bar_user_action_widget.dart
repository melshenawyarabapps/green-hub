import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../../generated/assets.dart';

class AppBarUserActionWidget extends StatelessWidget {
  const AppBarUserActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            hintText: LocaleKeys.enterTrackingNumber.tr(),
            prefixIcon: Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppLightColors.greyColor5,
              ),
              child: SvgPicture.asset(
                Assets.svgsSearch,
                width: 14.w,
                height: 14.h,
              ),
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
        ),
        12.horizontalSpace,
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppLightColors.primaryColor,
          ),
          child: const CustomSvgBuilder(path: Assets.svgsSendWithRotate),
        ),
      ],
    );
  }
}

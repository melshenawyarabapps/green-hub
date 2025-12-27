import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/app_styles.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:pinput/pinput.dart';

class PinInputField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  final TextEditingController? controller;

  const PinInputField({
    super.key,
    this.onCompleted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          length: 4,
          controller: controller,
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: (_) => 16.horizontalSpace,
          keyboardType: TextInputType.number,
          onCompleted: onCompleted,
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
    );
  }
}


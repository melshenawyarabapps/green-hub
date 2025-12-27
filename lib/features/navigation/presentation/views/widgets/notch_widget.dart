import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class NotchWidget extends StatelessWidget {
  const NotchWidget({super.key, this.onTap,});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          shape: BoxShape.circle,
        ),
        padding: AppPadding.all(AppPadding.p2),
        child: Container(
          height: 52.h,
          width: 52.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppLightColors.primaryColor,
            shape: BoxShape.circle,

          ),
          child: SvgPicture.asset(Assets.svgsAdd),
        ),
      ),
    );
  }
}

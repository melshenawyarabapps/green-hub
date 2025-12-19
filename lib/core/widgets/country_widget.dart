import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30.h,
          width: 80.w,
          margin: AppPadding.onlyPadding(start: AppPadding.p8),
          decoration: theme.extension<AppDecorations>()?.circleWhiteBorderDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.iconsSa, width: 35.w, height: 22.h),
              4.horizontalSpace,
              Text('966+', style: theme.textTheme.displaySmall),
            ],
          ),
        ),
      ],
    );
  }
}

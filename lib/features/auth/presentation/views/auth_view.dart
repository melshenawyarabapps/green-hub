import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentGeometry.center,
        decoration:
            Theme.of(context).extension<AppDecorations>()?.mainDecoration,

        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(Assets.iconsLogo, height: 172.h, width: 172.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                290.verticalSpace,
                SvgPicture.asset(Assets.svgsSplash),
              ],
            ),
            Column(
              children: [
                310.verticalSpace,
                SvgPicture.asset(Assets.svgsSplash1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

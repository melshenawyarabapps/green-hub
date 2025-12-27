import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.onlyPadding(top: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(Assets.svgsWhiteLogo)],
        ),
      ),
    );
  }
}


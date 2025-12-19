import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class NotchWidget extends StatelessWidget {
  const NotchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.verticalPadding(AppPadding.p12),
      height: 3.h,
      width: 60.w,
      decoration: Theme.of(context).extension<AppDecorations>()?.notchDecoration,
    );
  }
}

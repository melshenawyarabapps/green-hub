import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/utils/app_padding.dart';

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.instance.verticalPadding(AppPadding.instance.p4),
      child: Image.asset(imagePath, height: 24.h),
    );
  }
}

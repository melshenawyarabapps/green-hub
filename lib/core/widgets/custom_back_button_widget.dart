import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 20.w, top: 6.h, bottom: 6.h, end: 20.w),
        decoration: Theme.of(context).extension<AppDecorations>()!.appBarDecoration,
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 16,
          weight: 700,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';

class ImageInWidget extends StatelessWidget {
  const ImageInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.asset(
        Assets.imagesChooseImage,
        fit: BoxFit.fill,
        width: 375.w,
        height: 800.h,
      ),
    );
  }
}

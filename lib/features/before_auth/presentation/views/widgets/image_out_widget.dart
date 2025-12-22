import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';

class ImageOutWidget extends StatelessWidget {
  const ImageOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      Assets.imagesChooseOut,
      fit: BoxFit.fill,
      width: 375.w,
      height: 510.h,
    );
  }
}

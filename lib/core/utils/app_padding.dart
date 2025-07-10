import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  AppPadding._();

  static AppPadding? _instance;

  static AppPadding get instance => _instance ??= AppPadding._();

  EdgeInsets verticalPadding(double height) =>
      EdgeInsets.symmetric(vertical: height).h;

  EdgeInsets horizontalPadding(double width) =>
      EdgeInsets.symmetric(horizontal: width).w;

  EdgeInsetsDirectional onlyPadding({
    start = 0.0,
    top = 0.0,
    end = 0.0,
    bottom = 0.0,
  }) => EdgeInsetsDirectional.only(
    top: top.h,
    bottom: bottom.h,
    start: start.w,
    end: end.w,
  );

  double get p8 => 8;

  double get p10 => 10;

  double get p12 => 12;

  double get p16 => 16;

  double get p24 => 24;

  double get p28 => 28;

  double get p32 => 32;
}

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
  EdgeInsets get zero =>
      EdgeInsets.zero;

  EdgeInsetsDirectional onlyPadding({
    double start = 0.0,
    double top = 0.0,
    double  end = 0.0,
    double  bottom = 0.0,
  }) => EdgeInsetsDirectional.only(
    top: top.h,
    bottom: bottom.h,
    start: start.w,
    end: end.w,
  );
  EdgeInsetsDirectional all(double all) => EdgeInsetsDirectional.only(
    top: all.h,
    bottom: all.h,
    start: all.w,
    end: all.w,
  );

  double get p4 => 4;
  double get p6 => 6;
  double get p8 => 8;

  double get p10 => 10;

  double get p12 => 12;

  double get p16 => 16;

  double get p24 => 24;

  double get p28 => 28;

  double get p32 => 32;
  double get p48 => 48;
}

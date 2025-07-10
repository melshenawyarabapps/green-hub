import 'package:flutter/material.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/core/utils/font_weights.dart';

class AppStyles {
  AppStyles._();

  static AppStyles? _instance;

  static AppStyles get instance => _instance ??= AppStyles._();

  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
  }

  // regular style

  TextStyle getBoldStyle({double? fontSize, required Color color}) {
    return _getTextStyle(
      fontSize ?? FontSizes.instance.s14,
      FontWeights.instance.bold,
      color,
    );
  }

  TextStyle getSemiBoldStyle({double? fontSize, required Color color}) {
    return _getTextStyle(
      fontSize ?? FontSizes.instance.s14,
      FontWeights.instance.semiBold,
      color,
    );
  }

  TextStyle getRegularStyle({double? fontSize, required Color color}) {
    return _getTextStyle(
      fontSize ?? FontSizes.instance.s14,
      FontWeights.instance.regular,
      color,
    );
  }

  // medium style

  TextStyle getMediumStyle({double? fontSize, required Color color}) {
    return _getTextStyle(
      fontSize ?? FontSizes.instance.s14,
      FontWeights.instance.medium,
      color,
    );
  }

  // light style

  TextStyle getLightStyle({double? fontSize, required Color color}) {
    return _getTextStyle(
      fontSize ?? FontSizes.instance.s14,
      FontWeights.instance.light,
      color,
    );
  }
}

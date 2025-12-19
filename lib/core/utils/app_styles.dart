import 'package:flutter/material.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';

abstract class AppStyles {
  static TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
    String? fontFamily,
  ) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }

  // regular style

  static TextStyle getBoldStyle({
    double? fontSize,
    required Color color,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontSize ?? FontSizes.s14,
      FontWeights.bold,
      color,
      fontFamily,
    );
  }

  static TextStyle getSemiBoldStyle({
    double? fontSize,
    required Color color,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontSize ?? FontSizes.s14,
      FontWeights.semiBold,
      color,
      fontFamily,
    );
  }

  static TextStyle getRegularStyle({
    double? fontSize,
    required Color color,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontSize ?? FontSizes.s14,
      FontWeights.regular,
      color,
      fontFamily,
    );
  }

  // medium style

  static TextStyle getMediumStyle({
    double? fontSize,
    required Color color,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontSize ?? FontSizes.s14,
      FontWeights.medium,
      color,
      fontFamily,
    );
  }

  // light style

  static TextStyle getLightStyle({
    double? fontSize,
    required Color color,
    String? fontFamily,
  }) {
    return _getTextStyle(
      fontSize ?? FontSizes.s14,
      FontWeights.light,
      color,
      fontFamily,
    );
  }
}

import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration mainDecoration;
  final BoxDecoration borderWhiteDecoration;
  final BoxDecoration borderWhite20Decoration;
  final BoxDecoration circleWhiteDecoration;
  final BoxDecoration circleWhite20Decoration;
  final BoxDecoration circleWhiteBorderDecoration;

  const AppDecorations({
    required this.mainDecoration,
    required this.borderWhite20Decoration,
    required this.borderWhiteDecoration,
    required this.circleWhiteDecoration,
    required this.circleWhite20Decoration,
    required this.circleWhiteBorderDecoration,
  });

  @override
  AppDecorations copyWith({
    BoxDecoration? mainDecoration,
    BoxDecoration? borderWhiteDecoration,
    BoxDecoration? borderWhite20Decoration,
    BoxDecoration? circleWhiteDecoration,
    BoxDecoration? circleWhite20Decoration,
    BoxDecoration? circleWhiteBorderDecoration,
  }) {
    return AppDecorations(
      mainDecoration: mainDecoration ?? this.mainDecoration,
      borderWhiteDecoration:
          borderWhiteDecoration ?? this.borderWhiteDecoration,
      borderWhite20Decoration:
          borderWhite20Decoration ?? this.borderWhite20Decoration,
      circleWhite20Decoration:
          circleWhite20Decoration ?? this.circleWhite20Decoration,
      circleWhiteDecoration:
          circleWhiteDecoration ?? this.circleWhiteDecoration,
      circleWhiteBorderDecoration:
          circleWhiteBorderDecoration ?? this.circleWhiteBorderDecoration,
    );
  }

  @override
  AppDecorations lerp(ThemeExtension<AppDecorations>? other, double t) {
    if (other is! AppDecorations) return this;
    return AppDecorations(
      mainDecoration:
          BoxDecoration.lerp(mainDecoration, other.mainDecoration, t)!,
      borderWhiteDecoration:
          BoxDecoration.lerp(
            borderWhiteDecoration,
            other.borderWhiteDecoration,
            t,
          )!,
      borderWhite20Decoration:
          BoxDecoration.lerp(
            borderWhite20Decoration,
            other.borderWhite20Decoration,
            t,
          )!,
      circleWhite20Decoration:
          BoxDecoration.lerp(
            circleWhite20Decoration,
            other.circleWhite20Decoration,
            t,
          )!,
      circleWhiteDecoration:
          BoxDecoration.lerp(
            circleWhiteDecoration,
            other.circleWhiteDecoration,
            t,
          )!,
      circleWhiteBorderDecoration:
          BoxDecoration.lerp(
            circleWhiteBorderDecoration,
            other.circleWhiteBorderDecoration,
            t,
          )!,
    );
  }
}

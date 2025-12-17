import 'package:flutter/material.dart';

class AppDecorations extends ThemeExtension<AppDecorations> {
  final BoxDecoration mainDecoration;
  final BoxDecoration borderWhiteDecoration;
  final BoxDecoration borderWhite10Decoration;

  const AppDecorations({
    required this.mainDecoration,
    required this.borderWhite10Decoration,
    required this.borderWhiteDecoration,
  });

  @override
  AppDecorations copyWith({
    BoxDecoration? mainDecoration,
    BoxDecoration? borderWhiteDecoration,
    BoxDecoration? borderWhite10Decoration,
  }) {
    return AppDecorations(
      mainDecoration: mainDecoration ?? this.mainDecoration,
      borderWhiteDecoration:
          borderWhiteDecoration ?? this.borderWhiteDecoration,
      borderWhite10Decoration:
          borderWhite10Decoration ?? this.borderWhite10Decoration,
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
      borderWhite10Decoration:
          BoxDecoration.lerp(
            borderWhite10Decoration,
            other.borderWhite10Decoration,
            t,
          )!,
    );
  }
}

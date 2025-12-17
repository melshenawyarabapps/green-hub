import 'package:flutter/material.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppLightColors.primaryColor,
    secondaryHeaderColor: AppLightColors.secondaryColor,
    extensions: [
      AppDecorations(
        mainDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppLightColors.primaryColor,
              AppLightColors.secondaryColor,
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            stops: [0.0478, 0.9454],
          ),
        ),
        borderWhite10Decoration: BoxDecoration(),
        borderWhiteDecoration: BoxDecoration(),
      ),
    ],
  );

  static ThemeData get darkTheme => ThemeData();
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/utils/app_styles.dart';
import 'package:gold/core/utils/font_sizes.dart';

class AppTheme {
  static AppTheme? _instance;

  AppTheme._();

  static AppTheme get instance => _instance ??= AppTheme._();

  ThemeData get lightTheme => ThemeData();

  ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppConfig.instance.darkColors!.primaryColor,
    primaryColor: AppConfig.instance.darkColors!.primaryColor,
    secondaryHeaderColor: AppConfig.instance.darkColors!.secondaryColor,
    splashColor: AppConfig.instance.darkColors!.transparent,
    highlightColor: AppConfig.instance.darkColors!.transparent,
    cardColor: AppConfig.instance.darkColors!.thirdColor,
    shadowColor: AppConfig.instance.darkColors!.primary900Color,
    appBarTheme: AppBarTheme(
      backgroundColor: AppConfig.instance.darkColors!.primaryColor,
      surfaceTintColor: AppConfig.instance.darkColors!.primaryColor,
      titleTextStyle: AppStyles.instance.getBoldStyle(
        color: AppConfig.instance.darkColors!.whiteColor,
        fontSize: FontSizes.instance.s16,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppConfig.instance.darkColors!.whiteColor,
      ),
      foregroundColor: AppConfig.instance.darkColors!.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppConfig.instance.darkColors!.primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppConfig.instance.darkColors!.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppConfig.instance.darkColors!.secondaryColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppConfig.instance.darkColors!.whiteColor,
      unselectedItemColor: AppConfig.instance.darkColors!.primaryColor,
      selectedLabelStyle: AppStyles.instance.getBoldStyle(
        fontSize: FontSizes.instance.s16,
        color: AppConfig.instance.darkColors!.whiteColor,
      ),
      unselectedLabelStyle: AppStyles.instance.getBoldStyle(
        fontSize: FontSizes.instance.s16,
        color: AppConfig.instance.darkColors!.primaryColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppConfig.instance.darkColors!.whiteColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppConfig.instance.darkColors!.primaryColor,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: AppStyles.instance.getBoldStyle(
        color: AppConfig.instance.darkColors!.whiteColor,
        fontSize: FontSizes.instance.s16,
      ),
      bodyMedium: AppStyles.instance.getMediumStyle(
        color: AppConfig.instance.darkColors!.whiteColor,
        fontSize: FontSizes.instance.s12,
      ),
      bodySmall: AppStyles.instance.getMediumStyle(
        color: AppConfig.instance.darkColors!.whiteColor,
        fontSize: FontSizes.instance.s8,
      ),
      displayLarge: AppStyles.instance.getBoldStyle(
        color: AppConfig.instance.darkColors!.primaryColor,
        fontSize: FontSizes.instance.s16,
      ),
      displayMedium: AppStyles.instance.getBoldStyle(
        color: AppConfig.instance.darkColors!.whiteColor,
        fontSize: FontSizes.instance.s17,
      ),
      displaySmall: AppStyles.instance.getMediumStyle(
        color: AppConfig.instance.darkColors!.greyColor1,
        fontSize: FontSizes.instance.s12,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppConfig.instance.darkColors!.whiteColor,
    )
  );
}

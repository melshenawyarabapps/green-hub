import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/app_styles.dart';
import 'package:greenhub/core/utils/font_sizes.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primaryColor: AppLightColors.primaryColor,
    secondaryHeaderColor: AppLightColors.secondaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppLightColors.primaryColor),
        foregroundColor: WidgetStatePropertyAll(AppLightColors.whiteColor),
        textStyle: WidgetStatePropertyAll(
          AppStyles.getBoldStyle(
            color: AppLightColors.whiteColor,
            fontSize: FontSizes.s18,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(335.w, 56.h)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppLightColors.primaryColor8),
        foregroundColor: WidgetStatePropertyAll(AppLightColors.primaryColor),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppLightColors.primaryColor30, width: AppRadius.r1),
        ),

        textStyle: WidgetStatePropertyAll(
          AppStyles.getBoldStyle(
            color: AppLightColors.primaryColor,
            fontSize: FontSizes.s18,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(335.w, 56.h)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: AppStyles.getSemiBoldStyle(
        color: AppLightColors.whiteColor,
        fontSize: FontSizes.s44,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      titleMedium: AppStyles.getRegularStyle(
        color: AppLightColors.whiteColor,
        fontSize: FontSizes.s17,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      titleSmall: AppStyles.getRegularStyle(
        color: AppLightColors.whiteColor,
        fontSize: FontSizes.s12,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      bodyMedium: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s26,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      bodyLarge: AppStyles.getSemiBoldStyle(
        color: AppLightColors.thirdColor,
        fontSize: FontSizes.s44,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
    ),
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
        borderWhite20Decoration: BoxDecoration(
          color: AppLightColors.white20Color,
          borderRadius: AppRadius.vertical(AppRadius.r40),
        ),
        borderWhiteDecoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          borderRadius: AppRadius.vertical(AppRadius.r40),
        ),
        circleWhite20Decoration: BoxDecoration(
          color: AppLightColors.white20Color,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        circleWhiteDecoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
      ),
    ],
  );

  static ThemeData get darkTheme => ThemeData();
}

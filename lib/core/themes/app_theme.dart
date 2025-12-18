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
      displaySmall: AppStyles.getRegularStyle(
        color: AppLightColors.greyColor4,
        fontSize: FontSizes.s12,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      bodyMedium: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s26,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      bodySmall: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s12,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      bodyLarge: AppStyles.getSemiBoldStyle(
        color: AppLightColors.thirdColor,
        fontSize: FontSizes.s44,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: AppLightColors.greyColor2,
      hintStyle: AppStyles.getRegularStyle(
        color: AppLightColors.greyColor3,
        fontSize: FontSizes.s12,
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.all(AppRadius.r40),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.all(AppRadius.r40),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.all(AppRadius.r40),
        borderSide: BorderSide(color: AppLightColors.primaryColor, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.all(AppRadius.r40),
        borderSide: BorderSide(color: AppLightColors.redColor, width: 1.w),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppLightColors
              .primaryColor; // Fill with primary color when selected
        }
        return AppLightColors.transparent; // No fill when not selected
      }),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppLightColors
              .whiteColor; // Fill with primary color when selected
        }
        return AppLightColors.greyColor3; // No fill when not selected
      }),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.all(AppRadius.r2)),
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
        circleWhiteBorderDecoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(color: AppLightColors.greyColor5),
        ),
      ),
    ],
  );

  static ThemeData get darkTheme => ThemeData();
}

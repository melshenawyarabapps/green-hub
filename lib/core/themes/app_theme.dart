import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/app_styles.dart';
import 'package:greenhub/core/utils/font_sizes.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppLightColors.whiteColor,
    primaryColor: AppLightColors.primaryColor,
    colorScheme: ColorScheme.light(
      secondaryContainer: AppLightColors.lightSecondaryColor,
      error: AppLightColors.redColor,
      onError: AppLightColors.darkRedColor,
    ),
    secondaryHeaderColor: AppLightColors.secondaryColor,
    canvasColor: AppLightColors.primaryColor12,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppLightColors.transparent,
      ),
    ),
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
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(AppPadding.zero),
        foregroundColor: WidgetStatePropertyAll(AppLightColors.secondaryColor),
        textStyle: WidgetStatePropertyAll(
          AppStyles.getBoldStyle(
            color: AppLightColors.secondaryColor,
            fontSize: FontSizes.s14,
          ),
        ),
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
      displayMedium: AppStyles.getRegularStyle(
        color: AppLightColors.greyColor6,
        fontSize: FontSizes.s14,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      displayLarge: AppStyles.getRegularStyle(
        color: AppLightColors.greyColor7,
        fontSize: FontSizes.s12,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
      labelSmall: AppStyles.getMediumStyle(
        color: AppLightColors.greyColor8,
        fontSize: FontSizes.s10,
      ),
      labelMedium: AppStyles.getSemiBoldStyle(
        color: AppLightColors.primaryColor,
        fontSize: FontSizes.s10,
      ),
      labelLarge: AppStyles.getSemiBoldStyle(
        color: AppLightColors.redColor,
        fontSize: FontSizes.s13,
      ),
      headlineMedium: AppStyles.getBoldStyle(
        color: AppLightColors.whiteColor,
        fontSize: 24.sp,
      ),
      headlineSmall: AppStyles.getBoldStyle(
        color: AppLightColors.blackColor,
        fontSize: FontSizes.s16,
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
      headlineLarge: AppStyles.getBoldStyle(
        color: AppLightColors.whiteColor,
        fontSize: FontSizes.s22,
        fontFamily: GoogleFonts.ibmPlexSansArabic().fontFamily,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppLightColors.greyColor9,
      space: 24.h,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppLightColors.transparent,
      shape: const CircleBorder(),
      hoverColor: AppLightColors.transparent,
      splashColor: AppLightColors.transparent,
      focusColor: AppLightColors.transparent,
      elevation: 0,
      extendedPadding: AppPadding.zero,
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
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppLightColors.transparent,
      modalBarrierColor: AppLightColors.black12Color,
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: AppLightColors.whiteColor,
      elevation: 10,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppLightColors.secondaryColor;
        }
        return AppLightColors.greyColor8;
      }),
      thumbColor: WidgetStateProperty.all(AppLightColors.whiteColor),
    ),
    extensions: [
      AppDecorations(
        appBarDecoration: const BoxDecoration(
          color: Color(0xff5CA68F),
          shape: BoxShape.circle,
        ),
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
          borderRadius: AppRadius.vertical(AppRadius.r100),
        ),
        circleWhiteDecoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          borderRadius: AppRadius.all(AppRadius.r100),
        ),
        circleWhiteBorderDecoration: BoxDecoration(
          color: AppLightColors.whiteColor,
          borderRadius: AppRadius.all(AppRadius.r100),
          border: Border.all(color: AppLightColors.greyColor5),
        ),
        selectedDecoration: BoxDecoration(
          color: AppLightColors.primaryColor,
          borderRadius: AppRadius.all(AppRadius.r4),
          border: Border.all(color: AppLightColors.primaryColor),
        ),
        unselectedDecoration: BoxDecoration(
          color: AppLightColors.transparent,
          borderRadius: AppRadius.all(AppRadius.r4),
          border: Border.all(color: AppLightColors.greyColor3),
        ),
        notchDecoration: BoxDecoration(
          color: AppLightColors.greyColor3,
          borderRadius: AppRadius.all(AppRadius.r10),
        ),
        profileDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
            colors: [
              AppLightColors.profileGradientStart,
              AppLightColors.profileGradientEnd,
            ],
          ),
          borderRadius: AppRadius.all(AppRadius.r12),
        ),
        secondaryDecoration: BoxDecoration(
          color: AppLightColors.secondaryColor,
          borderRadius: AppRadius.all(AppRadius.r12),
        ),
        grayDecoration: BoxDecoration(
          color: AppLightColors.greyColor2,
          borderRadius: AppRadius.all(AppRadius.r16),
        ),
      ),
    ],
  );

  static ThemeData get darkTheme => ThemeData();
}

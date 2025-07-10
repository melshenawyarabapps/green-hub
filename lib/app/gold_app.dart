import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/routing/app_router.dart';
import 'package:gold/core/routing/app_routes.dart';
import 'package:gold/core/services/navigator/navigator_service.dart';
import 'package:gold/core/themes/app_theme.dart';

class GoldApp extends StatelessWidget {
  static const GoldApp instance = GoldApp._();

  const GoldApp._();

  factory GoldApp() => GoldApp.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppConfig.instance.appName,
        theme: AppTheme.instance.lightTheme,
        darkTheme: AppTheme.instance.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.instance.onGenerateRoute,
        initialRoute: AppRoutes.instance.initialRoute,
      ),
    );
  }
}

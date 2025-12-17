import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/routing/app_router.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/themes/app_theme.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp._();

  factory DeliveryApp() {
    _instance ??= const DeliveryApp._();
    return _instance!;
  }

  static DeliveryApp? _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      builder: (_, _) =>
          MaterialApp(
            title: 'ShipHub Delivery',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRoutes.splashView,
          ),
    );
  }
}

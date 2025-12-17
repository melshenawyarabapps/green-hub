import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/routing/app_router.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/themes/app_theme.dart';
import 'package:greenhub/core/utils/app_constants.dart';

class UserApp extends StatelessWidget {
  const UserApp._();

  factory UserApp() {
    _instance ??= const UserApp._();
    return _instance!;
  }

  static UserApp? _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, _) =>
          MaterialApp(
            title: AppConstants.appName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRoutes.splashView,
          ),
    );
  }
}

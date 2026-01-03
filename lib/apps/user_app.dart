import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/routing/app_router.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/services/navigator/navigator_service.dart';
import 'package:greenhub/core/themes/app_theme.dart';
import 'package:greenhub/core/utils/app_colors.dart';

class UserApp extends StatelessWidget {
  const UserApp._();

  factory UserApp() {
    _instance ??= const UserApp._();
    return _instance!;
  }

  static UserApp? _instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppLightColors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      builder:
          (_, _) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: MaterialApp(
              navigatorKey: NavigatorService.navigatorKey,
              title: 'ShipHub',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: AppRoutes.navigationView,
            ),
          ),
    );
  }
}

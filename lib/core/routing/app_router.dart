import 'package:flutter/material.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/features/auth/presentation/views/auth_view.dart';
import 'package:greenhub/features/before_auth/presentation/views/before_auth_view.dart';
import 'package:greenhub/features/boarding/presentation/views/boarding_view.dart';
import 'package:greenhub/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const BoardingView());
      case AppRoutes.beforeAuthView:
        return MaterialPageRoute(builder: (_) => const BeforeAuthView());
      case AppRoutes.authView:
        return MaterialPageRoute(builder: (_) => const AuthView());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}

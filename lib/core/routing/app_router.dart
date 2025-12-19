import 'package:flutter/material.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/features/auth/presentation/views/auth_view.dart';
import 'package:greenhub/features/auth/presentation/views/login_view.dart';
import 'package:greenhub/features/auth/presentation/views/register_view.dart';
import 'package:greenhub/features/auth/presentation/views/verification_view.dart';
import 'package:greenhub/features/before_auth/presentation/views/before_auth_view.dart';
import 'package:greenhub/features/boarding/presentation/views/boarding_view.dart';
import 'package:greenhub/features/navigation/presentation/views/navigation_view.dart';
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
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.registerView:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case AppRoutes.verificationView:
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case AppRoutes.navigationView:
        return MaterialPageRoute(builder: (_) => const NavigationView());
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

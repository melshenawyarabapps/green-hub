import 'package:flutter/material.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/routing/app_routes.dart';
import 'package:gold/features/calculator/presentation/view/calculator_view.dart';
import 'package:gold/features/navigation/presentation/views/navigation_view.dart';

class AppRouter {
  static AppRouter? _instance;

  static AppRouter get instance => _instance ??= AppRouter._();

  AppRouter._();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (_) => const NavigationView());
      case AppRoutes.calculatorView:
        return MaterialPageRoute(builder: (_) => CalculatorView(type: settings.arguments as CurrencyType));
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

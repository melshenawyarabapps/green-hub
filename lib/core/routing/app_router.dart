import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/routing/app_routes.dart';
import 'package:gold/core/services/di/di.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/features/calculator/presentation/view/calculator_view.dart';
import 'package:gold/features/navigation/presentation/views/navigation_view.dart';

class AppRouter {
  static AppRouter? _instance;

  static AppRouter get instance => _instance ??= AppRouter._();

  AppRouter._();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider.value(
                value: getIt.get<BaseController>(),
                child: const NavigationView(),
              ),
        );
      case AppRoutes.calculatorView:
        return MaterialPageRoute(
          builder: (_) {
            final type = settings.arguments as CurrencyType;
            return BlocProvider.value(
              value: getIt.get<CalculatorController>(),
              child: CalculatorView(type: type),
            );
          },
        );
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

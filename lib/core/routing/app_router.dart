import 'package:flutter/material.dart';
import 'package:greenhub/core/routing/app_routes.dart';


abstract class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get topPadding => MediaQuery.paddingOf(this).top;

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  pop() => Navigator.of(this).pop();

  Future<T?> pushReplacementNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    return await Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}

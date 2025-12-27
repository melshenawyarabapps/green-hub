import 'package:flutter/material.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';

extension ContextExtensions on BuildContext {
  double get topPadding => MediaQuery.paddingOf(this).top;
  double get bottomPadding => MediaQuery.viewInsetsOf(this).bottom;

  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isUser => AppConfig.instance.currentFlavor.isUser;

  AppDecorations get decorations => Theme.of(this).extension<AppDecorations>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

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

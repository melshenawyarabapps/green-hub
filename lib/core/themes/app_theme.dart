import 'package:flutter/material.dart';

class AppTheme {
  static AppTheme? _instance;

  AppTheme._();

  static AppTheme get instance => _instance ??= AppTheme._();

  ThemeData get lightTheme => ThemeData();
  ThemeData get darkTheme => ThemeData();

}

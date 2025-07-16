import 'dart:developer';

class AppLogger {
  AppLogger._();

  static AppLogger? _instance;

  static AppLogger get instance => _instance ??= AppLogger._();

  void info(String message) {
    log('ℹ️ INFO: $message');
  }

  void warn(String message) {
    log('⚠️ WARNING: $message');
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    log('❌ ERROR: $message \n$error', stackTrace: stackTrace);
  }

  void debug(String message) {
    log('🐞 DEBUG: $message');
  }
}

class AppConstants {
  AppConstants._();

  static AppConstants? _instance;

  static AppConstants get instance => _instance ??= AppConstants._();

  final String appVersion = '1.0.0';

}

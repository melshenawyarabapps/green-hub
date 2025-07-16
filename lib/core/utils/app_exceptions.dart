 class AppExceptions {

  AppExceptions._();
  static AppExceptions? _instance;
  static AppExceptions get instance => _instance ??= AppExceptions._();

  void networkException() {}

  void updateException([String? message]) {}

  void unExpectedException([String? message]) {}

  void success(String message) {}
}

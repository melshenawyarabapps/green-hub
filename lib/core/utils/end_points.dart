
abstract class EndPoints {

  static const String baseUrl = 'https://greenhub.sa-fvs.com/api/v1';

  // Driver Auth endpoints
  static const String driverSendLoginOtp = '/auth/driver/send-otp';
  static const String driverSendRegisterOtp = '/auth/driver/send-register-otp';
  static const String driverVerifyOtp = '/auth/driver/verify-otp';
  static const String driverRegister = '/auth/driver/register';
  static const String driverLogout = '/driver/logout';

  // Customer Auth endpoints
  static const String customerSendOtp = '/auth/customer/send-otp';
  static const String customerVerifyOtp = '/auth/customer/verify-otp';
  static const String customerLogout = '/customer/logout';
}

import 'package:greenhub/core/errors/app_exceptions.dart';
import 'package:greenhub/core/services/api/api_service.dart';
import 'package:greenhub/core/utils/end_points.dart';
import 'package:greenhub/features/auth/data/models/auth_response.dart';
import 'package:greenhub/features/auth/data/models/register_request.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  // Customer (User) endpoints
  Future<AuthResponse> customerSendOtp({required String phone}) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.customerSendOtp,
        body: {'phone': phone},
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  Future<AuthResponse> customerVerifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.customerVerifyOtp,
        body: {
          'phone': phone,
          'otp': otp,
        },
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  // Driver endpoints
  Future<AuthResponse> driverSendLoginOtp({required String phone}) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.driverSendLoginOtp,
        body: {'phone': phone},
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  Future<AuthResponse> driverSendRegisterOtp({required String phone}) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.driverSendRegisterOtp,
        body: {'phone': phone},
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  Future<AuthResponse> driverVerifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.driverVerifyOtp,
        body: {
          'phone': phone,
          'otp': otp,
        },
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  Future<AuthResponse> driverRegister({required RegisterRequest request}) async {
    try {
      final response = await _apiService.post(
        endPoint: EndPoints.driverRegister,
        body: request.toJson(),
      );
      return AuthResponse.fromJson(response);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  // Logout endpoints
  Future<void> customerLogout() async {
    try {
      await _apiService.post(endPoint: EndPoints.customerLogout);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }

  Future<void> driverLogout() async {
    try {
      await _apiService.post(endPoint: EndPoints.driverLogout);
    } catch (e) {
      throw ServerException.fromException(e);
    }
  }
}


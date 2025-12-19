import 'package:greenhub/core/services/api/api_service.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<void> login({required String phone}) async {
    // Mock API call
    await Future.delayed(const Duration(seconds: 2));
    // In real app: await _apiService.post('login', {'phone': phone});
  }

  Future<void> register({
    required String fullName,
    required String phone,
    required String email,
    String? password,
  }) async {
    // Mock API call
    await Future.delayed(const Duration(seconds: 2));
    // In real app: await _apiService.post('register', {...});
  }
}

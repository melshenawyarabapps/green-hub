import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  // Keys
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userPhoneKey = 'user_phone';
  static const String _userEmailKey = 'user_email';
  static const String _userAvatarKey = 'user_avatar';

  // Token methods
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // User data methods
  Future<void> saveUserData({
    required int id,
    required String name,
    required String phone,
    String? email,
    String? avatar,
  }) async {
    await _storage.write(key: _userIdKey, value: id.toString());
    await _storage.write(key: _userNameKey, value: name);
    await _storage.write(key: _userPhoneKey, value: phone);
    if (email != null) {
      await _storage.write(key: _userEmailKey, value: email);
    }
    if (avatar != null) {
      await _storage.write(key: _userAvatarKey, value: avatar);
    }
  }

  Future<Map<String, String?>> getUserData() async {
    return {
      'id': await _storage.read(key: _userIdKey),
      'name': await _storage.read(key: _userNameKey),
      'phone': await _storage.read(key: _userPhoneKey),
      'email': await _storage.read(key: _userEmailKey),
      'avatar': await _storage.read(key: _userAvatarKey),
    };
  }

  // Clear all data (logout)
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}


import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  CacheService._();

  static CacheService? _instance;

  static CacheService get instance => _instance ??= CacheService._();


  Box? box;

  Future init(String boxName) async {
    box = await Hive.openBox(boxName);
  }

  Future<void> put<T>({required String key, required T value}) async {
    try {
      await box?.put(key, value);
    } catch (_) {}
  }

  T? get<T>({required String key, T? defaultValue}) {
    try {
      return box?.get(key, defaultValue: defaultValue);
    } catch (_) {
      return defaultValue;
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await box?.delete(key);
    } catch (_) {}
  }

  Future<void> clear() async {
    try {
      await box?.clear();
    } catch (_) {}
  }
}

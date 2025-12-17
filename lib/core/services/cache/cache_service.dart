import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  final Map<String, Box> _boxes = {};

  Box<T>? getBox<T>(String boxName) => _boxes[boxName] as Box<T>?;

  Future init() async {
    await Hive.initFlutter();
  }

  Future<Box<T>?> openBox<T>(String boxName) async {
    if (!_boxes.containsKey(boxName)) {
      _boxes[boxName] = await Hive.openBox<T>(boxName);
    }
    return _boxes[boxName] as Box<T>?;
  }

  Future<void> put<T>({
    required String boxName,
    required dynamic key,
    required T value,
  }) async {
    try {
      await openBox<T>(boxName);
      await getBox(boxName)?.put(key, value);
    } catch (_) {}
  }

  Future<List<T>?> getValues<T>({required String boxName}) async {
    try {
      await openBox<T>(boxName);

      return getBox<T>(boxName)?.values.toList();
    } catch (_) {
      return [];
    }
  }

  Future<T?> get<T>({required String boxName, required dynamic key}) async {
    try {
      await openBox<T>(boxName);

      return getBox<T>(boxName)?.get(key);
    } catch (_) {
      return null;
    }
  }

  Future<bool> containsKey<T>({
    required String boxName,
    required dynamic key,
  }) async {
    try {
      await openBox<T>(boxName);

      return getBox<T>(boxName)?.containsKey(key) ?? false;
    } catch (_) {
      return false;
    }
  }

  Future<void> delete<T>({
    required String boxName,
    required dynamic key,
  }) async {
    try {
      await openBox<T>(boxName);

      await getBox(boxName)?.delete(key);
    } catch (_) {}
  }

  Future<void> clear<T>({required String boxName}) async {
    try {
      await openBox<T>(boxName);

      await getBox(boxName)?.clear();
    } catch (_) {}
  }
}

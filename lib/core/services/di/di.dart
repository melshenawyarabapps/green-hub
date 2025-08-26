import 'package:get_it/get_it.dart';
import 'package:gold/core/services/api/api_service.dart';
import 'package:gold/core/services/cache/cache_service.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService.instance);
  getIt.registerLazySingleton(() => ApiService.instance);
}

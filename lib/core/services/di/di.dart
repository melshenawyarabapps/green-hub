import 'package:get_it/get_it.dart';
import 'package:greenhub/core/services/api/api_service.dart';
import 'package:greenhub/core/services/cache/cache_service.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => ApiService());
}

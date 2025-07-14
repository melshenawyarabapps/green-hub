import 'package:get_it/get_it.dart';
import 'package:gold/core/services/api/api_service.dart';
import 'package:gold/core/services/cache/cache_service.dart';
import 'package:gold/features/ads/data/repos/ads_repo.dart';
import 'package:gold/features/ads/presentation/controllers/ads_controller.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService.instance);
  getIt.registerLazySingleton(() => ApiService.instance);
  getIt.registerLazySingleton(() => AdsRepo());
  getIt.registerFactory(() => AdsController(getIt.get<AdsRepo>()));
}

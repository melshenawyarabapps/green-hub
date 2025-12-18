import 'package:get_it/get_it.dart';
import 'package:greenhub/core/services/api/api_service.dart';
import 'package:greenhub/core/services/cache/cache_service.dart';
import 'package:greenhub/features/boarding/data/repos/boarding_repository.dart';
import 'package:greenhub/features/boarding/presentation/cubit/boarding_cubit.dart';
import 'package:greenhub/features/splash/presentation/cubit/splash_cubit.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(
    () => BoardingRepository(getIt.get<CacheService>()),
  );
  getIt.registerFactory(
    () => BoardingCubit(getIt.get<BoardingRepository>()),
  );
  getIt.registerFactory(
    () => SplashCubit(getIt.get<BoardingRepository>()),
  );
}

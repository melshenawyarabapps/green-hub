import 'package:get_it/get_it.dart';
import 'package:greenhub/core/services/api/api_service.dart';
import 'package:greenhub/core/services/cache/cache_service.dart';
import 'package:greenhub/core/services/storage/secure_storage_service.dart';
import 'package:greenhub/features/addresses/data/repos/address_repository.dart';
import 'package:greenhub/features/addresses/presentation/cubit/address_cubit.dart';
import 'package:greenhub/features/boarding/data/repos/boarding_repository.dart';
import 'package:greenhub/features/boarding/presentation/cubit/boarding_cubit.dart';
import 'package:greenhub/features/splash/presentation/cubit/splash_cubit.dart';

import 'package:greenhub/features/auth/data/repos/auth_repository.dart';
import 'package:greenhub/features/auth/presentation/cubit/auth_cubit.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService());
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => SecureStorageService());
  getIt.registerLazySingleton(
    () => BoardingRepository(getIt.get<CacheService>()),
  );
  getIt.registerLazySingleton(() => AuthRepository(getIt.get<ApiService>()));
  getIt.registerFactory(() => BoardingCubit(getIt.get<BoardingRepository>()));
  getIt.registerFactory(() => SplashCubit(
    getIt.get<BoardingRepository>(),
    getIt.get<SecureStorageService>(),
  ));
  getIt.registerFactory(() => AuthCubit(
    getIt.get<AuthRepository>(),
    getIt.get<SecureStorageService>(),
  ));

  getIt.registerLazySingleton<AddressRepository>(
    () => AddressRepository(),
  );

  getIt.registerFactory<AddressCubit>(
    () => AddressCubit(getIt.get<AddressRepository>())
  );

}

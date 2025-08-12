import 'package:get_it/get_it.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/services/api/api_service.dart';
import 'package:gold/core/services/cache/cache_service.dart';
import 'package:gold/features/ads/data/repos/ads_repo.dart';
import 'package:gold/features/ads/presentation/controllers/ads_controller.dart';
import 'package:gold/features/base/data/repos/base_repo.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';
import 'package:gold/features/calculator/data/repos/calculator_repo.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/features/more/data/repos/more_repo.dart';
import 'package:gold/features/more/presentation/controllers/more_controller.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerLazySingleton(() => CacheService.instance);
  getIt.registerLazySingleton(() => ApiService.instance);
  getIt.registerLazySingleton(() => AdsRepo());
  getIt.registerFactory(() => AdsController(getIt.get<AdsRepo>()));

  getIt.registerLazySingleton<CalculatorRepo>(() => CalculatorRepo());

  getIt.registerLazySingleton<BaseRepo>(
    () => BaseRepo(getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<MoreRepo>(
    () => MoreRepo(getIt.get<ApiService>()),
  );

  getIt.registerFactoryParam<CalculatorController, CurrencyType, CurrencyType?>(
    (param1, param2) =>
        CalculatorController(getIt.get<CalculatorRepo>(), param1),
  );

  getIt.registerFactory<BaseController>(
    () => BaseController(getIt.get<BaseRepo>()),
  );
  getIt.registerFactory<MoreController>(
    () => MoreController(getIt.get<MoreRepo>()),
  );
}

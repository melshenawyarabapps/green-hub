import 'package:greenhub/core/services/cache/cache_service.dart';
import 'package:greenhub/core/utils/app_constants.dart';

class BoardingRepository {
  final CacheService _cacheService;

  BoardingRepository(this._cacheService);

  Future<bool> isBoardingViewed() async {
    final result = await _cacheService.get<bool>(
      boxName: AppConstants.boardingBoxName,
      key: AppConstants.boardingViewedKey,
    );
    return result == true;
  }

  Future<void> setBoardingViewed() async {
    await _cacheService.put<bool>(
      boxName: AppConstants.boardingBoxName,
      key: AppConstants.boardingViewedKey,
      value: true,
    );
  }
}

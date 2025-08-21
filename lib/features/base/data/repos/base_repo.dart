import 'package:dartz/dartz.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/date_extensions.dart';
import 'package:gold/core/extensions/map_extensions.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/core/services/api/api_errors.dart';
import 'package:gold/core/services/api/api_service.dart';

class BaseRepo {
  final ApiService _apiService;

  BaseRepo(this._apiService);

  Future<Either<Failure, (List<BaseModel>, String)>> getData(
    CurrencyType type,
  ) async {
    try {
      final response = await _apiService.get(endPoint: type.endPoint);
      final data = response['data'] as List<dynamic>;
      String lastUpdated = '';
      final jsonLastUpdated = response['meta']?['latest_updated'];
      if (jsonLastUpdated is int) {
        lastUpdated =
            DateTime.fromMillisecondsSinceEpoch(jsonLastUpdated ).format;
      }

      final List<BaseModel> list = [];

      for (var item in data) {
        list.add((item as Map).toModel(type));
      }
      return Right((list, lastUpdated));
    } catch (e) {
      return Left(ServerFailure.generalException(e));
    }
  }
}

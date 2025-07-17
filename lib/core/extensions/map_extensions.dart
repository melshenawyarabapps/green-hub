import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/bullion/data/models/bullion_model.dart';
import 'package:gold/features/currencies/data/models/currency_model.dart';
import 'package:gold/features/gold/data/models/gold_model.dart';

extension MapExtensions on Map? {
  BaseModel toModel(CurrencyType type) {
    return switch (type) {
      CurrencyType.currencies => CurrencyModel.fromJson(this!).toModel,
      CurrencyType.gold => GoldModel.fromJson(this!).toModel,
      CurrencyType.bullion => BullionModel.fromJson(this!).toModel,
    };
  }
}

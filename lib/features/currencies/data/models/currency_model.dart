import 'package:equatable/equatable.dart';
import 'package:gold/features/base/data/models/base_model.dart';

class CurrencyModel extends Equatable {
  final int id;
  final String targetCurrency;
  final String iconTargetCurrency;
  final String baseRate;
  final String targetRate;

  const CurrencyModel({
    required this.id,
    required this.targetCurrency,
    required this.iconTargetCurrency,
    required this.baseRate,
    required this.targetRate,
  });

  factory CurrencyModel.fromJson(Map json) =>
      CurrencyModel(
        id: json['id'],
        targetCurrency: json['target_currency'],
        iconTargetCurrency: json['icon_target_currency'],
        baseRate: json['base_rate'],
        targetRate: json['target_rate'],
      );

  @override
  List<Object?> get props =>
      [
        id,
        targetCurrency,
        iconTargetCurrency,
        baseRate,
        targetRate,
      ];
}

extension CurrencyModelExtension on CurrencyModel {
  BaseModel get toModel =>
      BaseModel(
          id: id,
          name: targetCurrency,
          icon: iconTargetCurrency,
          basePrice: baseRate,
          dollarPrice: targetRate,
          changeAmount: '',
          statusPrice: '',
      );
}

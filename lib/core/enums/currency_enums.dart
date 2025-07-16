import 'package:gold/core/utils/calculator_constants.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';

enum CurrencyType { currencies, gold, bullion }

extension CurrencyTypeExtension on CurrencyType {
  bool get isCurrency => this == CurrencyType.currencies;

  bool get isGold => this == CurrencyType.gold;

  bool get isBullion => this == CurrencyType.bullion;

  CalculatorModel get mock => switch (this) {
    CurrencyType.currencies => CalculatorConstants.instance.currenciesMock,
    CurrencyType.gold => CalculatorConstants.instance.goldMock,
    CurrencyType.bullion => CalculatorConstants.instance.bullionMock,
  };
}

enum CurrencyType {
  currencies,
  gold,
  bullion,
}

extension CurrencyTypeExtension on CurrencyType {
  bool get isCurrency => this == CurrencyType.currencies;
  bool get isGold => this == CurrencyType.gold;
  bool get isBullion => this == CurrencyType.bullion;

}
import 'package:equatable/equatable.dart';
import 'package:gold/core/enums/currency_enums.dart';

class CalculatorModel extends Equatable {
  final String totalPrice;
  final List<CardModel> cards;
  final CurrencyType type;

  const CalculatorModel({
    required this.totalPrice,
    required this.cards,
    required this.type,
  });

  CalculatorModel copyWith({
    String? totalPrice,
    List<CardModel>? cards,
    CurrencyType? type,
  }) {
    return CalculatorModel(
      totalPrice: totalPrice ?? this.totalPrice,
      cards: cards ?? this.cards,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [totalPrice, cards, type];
}

class CardModel extends Equatable {
  final String title;
  final String price;
  final String currencyPrice;
  final bool isSelected;
  final bool hasPercent;
  final bool isPercent;
  final bool canSelect;

  const CardModel({
    required this.title,
    required this.price,
    required this.isSelected,
    required this.hasPercent,
    required this.isPercent,
    this.canSelect = true,
    this.currencyPrice = '',
  });

  CardModel copyWith({
    String? title,
    String? price,
    String? currencyPrice,
    bool? isSelected,
    bool? isPercent,
    bool? hasPercent,
    bool? canSelect,
  }) {
    return CardModel(
      title: title ?? this.title,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
      isPercent: isPercent ?? this.isPercent,
      hasPercent: hasPercent ?? this.hasPercent,
      canSelect: canSelect ?? this.canSelect,
      currencyPrice: currencyPrice ?? this.currencyPrice,
    );
  }

  @override
  List<Object?> get props => [
    title,
    price,
    isSelected,
    isPercent,
    hasPercent,
    canSelect,
  ];
}

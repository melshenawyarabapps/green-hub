import 'package:equatable/equatable.dart';

class CalculatorModel extends Equatable {
  final String totalPrice;
  final List<CardModel> cards;

  const CalculatorModel({required this.totalPrice, required this.cards});

  CalculatorModel copyWith({String? totalPrice, List<CardModel>? cards}) {
    return CalculatorModel(
      totalPrice: totalPrice ?? this.totalPrice,
      cards: cards ?? this.cards,
    );
  }

  @override
  List<Object?> get props => [totalPrice, cards];
}

class CardModel extends Equatable {
  final String title;
  final String price;
  final bool isSelected;
  final bool hasPercent;
  final bool isPercent;

  const CardModel({
    required this.title,
    required this.price,
    required this.isSelected,
    required this.hasPercent,
    required this.isPercent,
  });

  CardModel copyWith({
    String? title,
    String? price,
    bool? isSelected,
    bool? isPercent,
    bool? hasPercent,
  }) {
    return CardModel(
      title: title ?? this.title,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
      isPercent: isPercent ?? this.isPercent,
      hasPercent: hasPercent ?? this.hasPercent,
    );
  }

  @override
  List<Object?> get props => [title, price, isSelected, isPercent, hasPercent];
}

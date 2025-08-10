part of 'calculator_controller.dart';

class CalculatorState extends Equatable {
  final CalculatorModel? calculatorModel;
  final RequestStatus categoriesStatus;
  final CurrencyType? type;

  const CalculatorState({
    this.calculatorModel,
    this.type,
    this.categoriesStatus = RequestStatus.initial,
  });

  String? get currentPrice {
    if (type.isCurrency) {
      return null;
    }

    final cards = calculatorModel?.cards;
    if (cards == null || cards.length < 2) {
      return null;
    }

    return cards[1].price;
  }
  CalculatorState copyWith({
    CalculatorModel? calculatorModel,
    CurrencyType? type,
    RequestStatus? categoriesStatus,
  }) {
    return CalculatorState(
      calculatorModel:
          calculatorModel ?? this.calculatorModel ?? this.type?.mock,
      type: type ?? this.type,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }

  @override
  List<Object?> get props => [calculatorModel, type, categoriesStatus];
}

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

  CalculatorState copyWith({
    CalculatorModel? calculatorModel,
    CurrencyType? type,
    RequestStatus? categoriesStatus,
  }) {
    return CalculatorState(
      calculatorModel: calculatorModel ?? this.calculatorModel??this.type?.mock,
      type: type??this.type,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }

  @override
  List<Object?> get props => [calculatorModel, type, categoriesStatus];
}

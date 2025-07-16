part of 'calculator_controller.dart';

class CalculatorState extends Equatable {
  final CalculatorModel? calculatorModel;
  final List<CategoryModel>? categories;
  final RequestStatus categoriesStatus;
  final CurrencyType? type;

  const CalculatorState({
     this.calculatorModel,
     this.type,
    this.categories = const [],
    this.categoriesStatus = RequestStatus.initial,
  });

  CalculatorState copyWith({
    CalculatorModel? calculatorModel,
    List<CategoryModel>? categories,
    CurrencyType? type,
    RequestStatus? categoriesStatus,
  }) {
    return CalculatorState(
      calculatorModel: calculatorModel ?? this.calculatorModel,
      categories: categories ?? this.categories,
      type: type??this.type,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }

  @override
  List<Object?> get props => [calculatorModel, type, categories,categoriesStatus];
}

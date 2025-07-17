
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/data/models/category_model.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/features/calculator/data/repos/calculator_repo.dart';

part 'calculator_state.dart';

class CalculatorController extends Cubit<CalculatorState> {
  CalculatorController(this._calculatorRepo) : super(const CalculatorState());

  final CalculatorRepo _calculatorRepo;

  void init(CurrencyType type) {
    emit(state.copyWith(calculatorModel: type.mock, type: type));
  }


  void onCardPressed(int index) {
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onCardPressed(
          state.calculatorModel,
          index,
        ),
      ),
    );
  }

  void onNumberPressed(NumberModel model) {
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onNumberPressed(
          state.calculatorModel,
          model,
        ),
      ),
    );
  }

  void onCategoryPressed(CategoryModel model) {
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onCategoryPressed(
          state.calculatorModel,
          model,
        ),
      ),
    );
  }

  void onPercentPressed(int index) {
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onPercentPressed(
          state.calculatorModel,
          index,
        ),
      ),
    );
  }
}

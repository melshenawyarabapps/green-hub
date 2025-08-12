import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/features/calculator/data/repos/calculator_repo.dart';

part 'calculator_state.dart';

class CalculatorController extends Cubit<CalculatorState> {
  CalculatorController(this._calculatorRepo, CurrencyType type)
    : super(CalculatorState(calculatorModel: type.mock, type: type));

  final CalculatorRepo _calculatorRepo;

  void onCardPressed(int index) {
    refillModel();
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
    refillModel();
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onNumberPressed(
          state.calculatorModel,
          model,
        ),
      ),
    );
  }

  void onCategoryPressed(BaseModel model) {
    refillModel();
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
    refillModel();
    emit(
      state.copyWith(
        calculatorModel: _calculatorRepo.onPercentPressed(
          state.calculatorModel,
          index,
        ),
      ),
    );
  }

  void refillModel() {
    if (state.calculatorModel == null) {
      emit(state.copyWith(calculatorModel: state.type.mock));
    }
  }
}

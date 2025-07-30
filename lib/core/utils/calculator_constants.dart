import 'package:easy_localization/easy_localization.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/enums/number_enums.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/translations/locale_keys.g.dart';

class CalculatorConstants {
  CalculatorConstants._();

  static CalculatorConstants? _instance;

  static CalculatorConstants get instance =>
      _instance ??= CalculatorConstants._();

  CalculatorModel get goldMock => CalculatorModel(
    totalPrice: '00.0',
    type: CurrencyType.gold,
    cards: [
      CardModel(
        title: LocaleKeys.grams.tr(),
        price: '00.0',
        isSelected: true,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: LocaleKeys.caliberPrice.tr(),
        price: '00.0',
        isSelected: false,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: LocaleKeys.workmanshipPerGram.tr(),
        price: '00.0',
        isSelected: false,
        isPercent: true,
        hasPercent: true,
      ),
      CardModel(
        title: LocaleKeys.taxPerGram.tr(),
        price: '00.0',
        isSelected: false,
        isPercent: false,
        hasPercent: true,
      ),
    ],
  );

  CalculatorModel get currenciesMock => CalculatorModel(
    totalPrice: '00.0',
    type: CurrencyType.currencies,
    cards: [
      CardModel(
        title: LocaleKeys.from.tr(),
        price: LocaleKeys.selectCurrency.tr(),
        isSelected: true,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: LocaleKeys.to.tr(),
        price: LocaleKeys.selectCurrency.tr(),
        isSelected: false,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: '',
        price: '00.0',
        isSelected: false,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: '',
        price: '00.0',
        isSelected: false,
        hasPercent: false,
        isPercent: false,
        canSelect: false
      ),
    ],
  );

  CalculatorModel get bullionMock =>CalculatorModel(
    totalPrice: '00.0',
    type: CurrencyType.bullion,
    cards: [
      CardModel(
        title: LocaleKeys.grams.tr(),
        price: '00.0',
        isSelected: true,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: LocaleKeys.caliberPrice.tr(),
        price: '00.0',
        isSelected: false,
        hasPercent: false,
        isPercent: false,
      ),
      CardModel(
        title: LocaleKeys.workmanshipPerGram.tr(),
        price: '00.0',
        isSelected: false,
        isPercent: true,
        hasPercent: true,
      ),
      CardModel(
        title: LocaleKeys.taxPerGram.tr(),
        price: '00.0',
        isSelected: false,
        isPercent: false,
        hasPercent: true,
      ),
    ],
  );

  List<NumberModel> get numbers=>[
    const NumberModel(
      number: 'DEL',
      type: NumberType.delete,
    ),
    const NumberModel(
      number: 'C',
      type: NumberType.c,
    ),
    const NumberModel(
      number: 'AC',
      type: NumberType.ac,
    ),
    for (int index = 9; index >= 1; index--)
      NumberModel(
        number: index.toString(),
        type: NumberType.number,
      ),
    const NumberModel(
      number: '=',
      type: NumberType.equal,
    ),
    const NumberModel(
      number: '.',
      type: NumberType.number,
    ),
    const NumberModel(
      number: '0',
      type: NumberType.number,
    ),
  ];

}

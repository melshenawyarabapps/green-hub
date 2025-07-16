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
    // calculatePrice: (List<CardModel> cards) {
    //   final grams = cards[0].price;
    //   final caliberPrice = cards[1].price;
    //   final workmanshipPerGram = cards[2].price;
    //   final taxPerGram = cards[3].price;
    //   final isWorkmanshipPercent = cards[2].isPercent;
    //   final isTaxPercent = cards[3].isPercent;
    //
    //   final gramsValue = _parsePrice(grams);
    //   final caliberPriceValue = _parsePrice(caliberPrice);
    //   var workmanshipPerGramValue = _parsePrice(workmanshipPerGram);
    //   var taxPerGramValue = _parsePrice(taxPerGram);
    //
    //   if (isWorkmanshipPercent) {
    //     workmanshipPerGramValue =
    //         ((caliberPriceValue * workmanshipPerGramValue) / 100);
    //   }
    //
    //   if (isTaxPercent) {
    //     taxPerGramValue = ((caliberPriceValue * taxPerGramValue) / 100);
    //   }
    //
    //   final totalPrice =
    //       (taxPerGramValue + workmanshipPerGramValue + caliberPriceValue) *
    //       gramsValue;
    //
    //   return totalPrice.toStringAsFixed(2);
    // },
  );

  CalculatorModel get currenciesMock => goldMock;

  CalculatorModel get bullionMock => goldMock;

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

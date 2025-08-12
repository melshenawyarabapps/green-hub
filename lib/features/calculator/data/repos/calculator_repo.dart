import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/enums/number_enums.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/utils/app_exceptions.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/translations/locale_keys.g.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

class CalculatorRepo {
  CalculatorModel? onCardPressed(CalculatorModel? model, int index) {
    if (model == null || !model.cards[index].canSelect) {
      return model;
    }

    final List<CardModel> newCards = List.from(model.cards);

    for (int i = 0; i < newCards.length; i++) {
      newCards[i] = newCards[i].copyWith(isSelected: i == index);
    }
    return model.copyWith(cards: newCards);
  }

  CalculatorModel? onNumberPressed(
    CalculatorModel? calculatorModel,
    NumberModel numberModel,
  ) {
    if (calculatorModel == null) {
      return calculatorModel;
    }
    final newCalculatorModel = CalculatorModel(
      totalPrice: calculatorModel.totalPrice,
      cards: List.from(calculatorModel.cards),
      type: calculatorModel.type,
    );
    final selectedCardIndex = newCalculatorModel.cards.indexWhere(
      (element) => element.isSelected,
    );
    if (selectedCardIndex == -1) {
      return newCalculatorModel;
    }
    CardModel selectedCard = newCalculatorModel.cards[selectedCardIndex];
    if (calculatorModel.type.isCurrency && selectedCardIndex < 2) {
      return calculatorModel;
    }
    final price = selectedCard.price.parsePrice;
    switch (numberModel.type) {
      case NumberType.number:
        if (price == 0) {
          selectedCard = selectedCard.copyWith(
            price: numberModel.number == '.' ? null : numberModel.number,
          );
        } else {
          if (selectedCard.isPercent) {
            final newPrice =
                (selectedCard.price + numberModel.number).parsePrice;
            if (newPrice <= 100) {
              selectedCard = selectedCard.copyWith(
                price: selectedCard.price + numberModel.number,
              );
            } else {
              selectedCard = selectedCard.copyWith(price: '100');
            }
          } else {
            selectedCard = selectedCard.copyWith(
              price: selectedCard.price + numberModel.number,
            );
          }
        }
        break;
      case NumberType.delete:
        if (price != 0 && selectedCard.price.length != 1) {
          selectedCard = selectedCard.copyWith(
            price: selectedCard.price.substring(
              0,
              selectedCard.price.length - 1,
            ),
          );
        } else {
          selectedCard = selectedCard.copyWith(price: '00.0');
        }
        break;
      case NumberType.c:
        selectedCard = selectedCard.copyWith(price: '00.0');
        break;
      case NumberType.ac:
        final List<CardModel> newCards = [];
        for (var card in newCalculatorModel.cards) {
          newCards.add(card.copyWith(price: '00.0'));
        }
        return newCalculatorModel.copyWith(cards: newCards);
      case NumberType.equal:
        if (newCalculatorModel.type.isCurrency) {
          newCalculatorModel.cards[3] = newCalculatorModel.cards[3].copyWith(
            price: _getTotalPrice(newCalculatorModel),
          );
          return newCalculatorModel;
        }
        return newCalculatorModel.copyWith(
          totalPrice: _getTotalPrice(newCalculatorModel),
        );
    }
    newCalculatorModel.cards[selectedCardIndex] = selectedCard;
    return newCalculatorModel;
  }

  String _getTotalPrice(CalculatorModel model) {
    switch (model.type) {
      case CurrencyType.currencies:
        num fromDollarPrice = model.cards[0].currencyPrice.parsePrice;
        num toDollarPrice = model.cards[1].currencyPrice.parsePrice;
        num fromCount = model.cards[2].price.parsePrice;
        final totalPrice = (toDollarPrice * fromCount) / fromDollarPrice;
        return totalPrice == 0 ? '00.0' : totalPrice.toStringAsFixed(2);
      default:
        num grams = 0;
        num price = 0;
        num work = 0;
        num tax = 0;
        final workCard = model.cards[2];
        final taxCard = model.cards[3];
        grams = model.cards[0].price.parsePrice;
        price = model.cards[1].price.parsePrice;
        work =
            workCard.hasPercent && workCard.isPercent
                ? (price / 100) * workCard.price.parsePrice
                : workCard.price.parsePrice;
        tax =
            taxCard.hasPercent && taxCard.isPercent
                ? (price / 100) * taxCard.price.parsePrice
                : taxCard.price.parsePrice;
        final totalPrice = grams * (price + work + tax);
        return totalPrice == 0 ? '00.0' : totalPrice.toStringAsFixed(2);
    }
  }

  CalculatorModel? onCategoryPressed(
    CalculatorModel? calculatorModel,
    BaseModel baseModel,
  ) {
    if (calculatorModel == null) {
      return calculatorModel;
    }

    final newCalculatorModel = CalculatorModel(
      totalPrice: calculatorModel.totalPrice,
      cards: List.from(calculatorModel.cards),
      type: calculatorModel.type,
    );
    switch (newCalculatorModel.type) {
      case CurrencyType.currencies:
        for (int i = 0; i < 2; i++) {
          if (newCalculatorModel.cards[i].isSelected) {
            newCalculatorModel.cards[i] = newCalculatorModel.cards[i].copyWith(
              price: baseModel.name,
              currencyPrice: baseModel.dollarPrice,
            );
          }
        }
        break;
      default:
        newCalculatorModel.cards[1] = newCalculatorModel.cards[1].copyWith(
          price: baseModel.basePrice,
        );
        break;
    }

    return newCalculatorModel;
  }

  CalculatorModel? onPercentPressed(CalculatorModel? model, int index) {
    if (model == null) {
      return model;
    }

    final List<CardModel> newCards = List.from(model.cards);
    newCards[index] = model.cards[index].copyWith(
      isPercent: !model.cards[index].isPercent,
      price: '00.0',
    );
    return model.copyWith(cards: newCards);
  }

  Future<void> takeScreenshot(GlobalKey globalKey) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/Gold-${AppConfig.instance.currentFlavor.toUpperCase()}.png';
      File file = File(filePath);
      await file.writeAsBytes(pngBytes);
      SharePlus.instance.share(
        ShareParams(
          previewThumbnail: XFile(filePath),
          files: [XFile(filePath)],
        ),
      );
    } catch (_) {
      AppExceptions.instance.unExpectedException(
        LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater.tr(),
      );
    }
  }
}

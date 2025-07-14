import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/features/ads/presentation/views/fluid_ad_mobile_widget.dart.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/presentation/view/widgets/calculator_app_bar.dart';
import 'package:gold/features/calculator/presentation/view/widgets/calculator_cards_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/categories_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/numbers_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/total_price_widget.dart';
import 'package:gold/translations/locale_keys.g.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key, required this.type});

  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(type: type),
      body: ListView(
        padding: AppPadding.instance.all(AppPadding.instance.p16),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Column(
              children: [
                CalculatorCardsWidget(cards: model.cards),
                4.verticalSpace,
                TotalPriceWidget(totalPrice: model.totalPrice),
              ],
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              CategoriesWidget(type: type),
              8.horizontalSpace,
              NumbersWidget(),
            ],
          ),
          16.verticalSpace,
          FluidAdMobileWidget(),
        ],
      ),
    );
  }
}

final model = CalculatorModel(
  totalPrice: '00.0',
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

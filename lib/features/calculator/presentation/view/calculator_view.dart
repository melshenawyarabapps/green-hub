import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/features/ads/presentation/views/fluid_ad_mobile_widget.dart.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/features/calculator/presentation/view/widgets/calculator_app_bar.dart';
import 'package:gold/features/calculator/presentation/view/widgets/calculator_cards_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/categories_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/numbers_widget.dart';
import 'package:gold/features/calculator/presentation/view/widgets/total_price_widget.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key, required this.type});

  final CurrencyType type;

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalculatorController>().init(widget.type);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(type: widget.type),
      body: ListView(
        padding: AppPadding.instance.all(AppPadding.instance.p16),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Column(
              children: [
                const CalculatorCardsWidget(),
                4.verticalSpace,
                const TotalPriceWidget(),
              ],
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              const CategoriesWidget(),
              8.horizontalSpace,
              const NumbersWidget(),
            ],
          ),
          16.verticalSpace,
          const FluidAdMobileWidget(),
        ],
      ),
    );
  }
}

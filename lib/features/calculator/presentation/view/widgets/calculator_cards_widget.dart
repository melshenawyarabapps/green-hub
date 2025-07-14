import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/presentation/view/widgets/calculator_card_widget.dart';

class CalculatorCardsWidget extends StatelessWidget {
  const CalculatorCardsWidget({super.key, required this.cards});

  final List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cards.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1.w,
        crossAxisSpacing: 1.w,
        childAspectRatio: 2.75,
      ),
      itemBuilder:
          (_, index) => CalculatorCardWidget(model: cards[index], index: index),
    );
  }
}

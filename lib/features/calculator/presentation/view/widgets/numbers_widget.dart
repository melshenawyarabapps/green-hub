import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/utils/calculator_constants.dart';
import 'package:gold/features/calculator/presentation/view/widgets/number_widget.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final numbers = CalculatorConstants.instance.numbers;
    return Expanded(
      flex: 3,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: numbers.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.w,
          crossAxisSpacing: 4.w,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (_, index) => NumberWidget(model: numbers[index]),
      ),
    );
  }
}

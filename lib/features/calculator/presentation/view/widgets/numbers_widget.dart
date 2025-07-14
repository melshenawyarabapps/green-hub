import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/number_enums.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/features/calculator/presentation/view/widgets/number_widget.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: calc.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.w,
          crossAxisSpacing: 4.w,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (_, index) => NumberWidget(model: calc[index]),
      ),
    );
  }
}

final calc = [
  NumberModel(number: 'DEL', type: NumberType.delete),
  NumberModel(number: 'C', type: NumberType.c),
  NumberModel(number: 'AC', type: NumberType.ac),
  for (int index = 9; index >= 1; index--)
    NumberModel(number: index.toString(), type: NumberType.number),
  NumberModel(number: '=', type: NumberType.equal),
  NumberModel(number: '.', type: NumberType.number),
  NumberModel(number: '0', type: NumberType.number),
];

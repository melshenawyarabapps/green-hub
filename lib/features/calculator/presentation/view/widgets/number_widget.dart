import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/number_enums.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/features/calculator/data/models/number_model.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key, required this.model});

  final NumberModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: model.type.color),
      ),
      child: InkWell(
        onTap: () {
          context.read<CalculatorController>().onNumberPressed(model);
        },
        splashColor:model.type.color,
        child: Center(
          child:
              model.text == null
                  ? Text(
                    model.number,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: model.type.color,
                      fontSize: FontSizes.instance.s24,
                    ),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: model.type.color,size: FontSizes.instance.s24,),
                      Text(
                        model.text!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: model.type.color,fontSize: FontSizes.instance.s10,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

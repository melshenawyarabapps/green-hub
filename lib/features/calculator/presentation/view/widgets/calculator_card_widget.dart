import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/core/utils/app_padding.dart';
import 'package:gold/core/utils/font_sizes.dart';
import 'package:gold/features/calculator/data/models/calculator_model.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/generated/assets.dart';

class CalculatorCardWidget extends StatelessWidget {
  const CalculatorCardWidget({
    super.key,
    required this.model,
    required this.index,
  });

  final CardModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.read<CalculatorController>().onCardPressed(index);
      },
      child: LayoutBuilder(
        builder: (_, size) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border:
                  model.isSelected
                      ? Border.all(
                        color: theme.secondaryHeaderColor,
                        width: 1.w,
                      )
                      : null,
              color: theme.shadowColor,
            ),
            child: Padding(
              padding: AppPadding.instance.all(AppPadding.instance.p6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: FontSizes.instance.s10,
                    ),
                  ),
                  Row(
                    children: [
                      if (model.hasPercent) const SizedBox.shrink(),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            model.price.formatNumber,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      if (model.hasPercent)
                        InkWell(
                          onTap: () {
                            context
                                .read<CalculatorController>()
                                .onPercentPressed(index);
                          },
                          child: Image.asset(
                            model.isPercent
                                ? Assets.iconsPercentage
                                : AppConfig.instance.appCurrency,
                            height: size.maxHeight * 0.5,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

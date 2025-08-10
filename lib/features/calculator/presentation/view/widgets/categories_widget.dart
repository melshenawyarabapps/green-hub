import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:gold/core/shared/loading_empty_widget.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/base/presentation/controllers/base_controller.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/features/calculator/presentation/view/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.type});

  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.screenWidth * 0.81,
        child: BlocSelector<BaseController, BaseState, (bool, List<BaseModel>)>(
          selector:
              (state) => (
                state.status[type]?.isLoading ?? false,
                state.data[type] ?? [],
              ),
          builder: (context, data) {
            final categories = data.$2;
            return categories.isNotEmpty
                ? BlocSelector<CalculatorController, CalculatorState, String>(
                  selector: (state) => state.currentPrice ?? '',
                  builder: (_, currentPrice) {
                    return ListView.separated(
                      separatorBuilder: (_, index) => 4.verticalSpaceFromWidth,
                      itemCount: categories.length,
                      itemBuilder:
                          (_, index) => CategoryItemWidget(
                            category: categories[index],
                            isSelected:
                                categories[index].basePrice == currentPrice,
                          ),
                    );
                  },
                )
                : LoadingEmptyWidget(isLoading: data.$1);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:gold/core/shared/loading_empty_widget.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/features/calculator/presentation/view/widgets/category_item_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.screenWidth * 0.81,
        child: BlocBuilder<CalculatorController, CalculatorState>(
          buildWhen:
              (previous, current) =>
                  previous.categoriesStatus != current.categoriesStatus,
          builder: (context, state) {
            final categories = state.categories ?? [];
            return categories.isNotEmpty
                ? ListView.separated(
                  separatorBuilder: (_, index) => SizedBox(height: 4.w),
                  itemCount: categories.length,
                  itemBuilder:
                      (_, index) =>
                          CategoryItemWidget(category: categories[index]),
                )
                : LoadingEmptyWidget(
                  isLoading: state.categoriesStatus.isLoading,
                );
          },
        ),
      ),
    );
  }
}

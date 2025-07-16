import 'package:cached_network_image_plus/cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/features/calculator/data/models/category_model.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';
import 'package:gold/generated/assets.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CalculatorController>().onCategoryPressed(category);
      },
      child: LayoutBuilder(
        builder: (_, size) {
          return SizedBox(
            height: size.maxWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).secondaryHeaderColor),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    category.icon.isNetwork
                        ? CachedImageWidget(url: category.icon)
                        : Image.asset(
                          Assets.testDemo,
                          height: size.maxWidth * 0.35,
                        ),
                    SizedBox(height: size.maxWidth * 0.05),
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

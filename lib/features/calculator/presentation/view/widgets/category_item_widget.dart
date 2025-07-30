import 'package:cached_network_image_plus/cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/extensions/string_extensions.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/features/calculator/presentation/controllers/calculator_controller.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});

  final BaseModel category;

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
                border: Border.all(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (category.icon.isNetwork) ...[
                      SizedBox(
                        height: size.maxWidth * 0.35,
                        child: CachedImageWidget(url: category.icon),
                      ),
                      SizedBox(height: size.maxWidth * 0.05),
                    ],

                    SizedBox(
                      width: size.maxWidth * 0.9,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          category.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                        ),
                      ),
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

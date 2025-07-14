import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/context_extensions.dart';
import 'package:gold/generated/assets.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.type});

  final CurrencyType type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: context.screenWidth * 0.81,
        child: ListView.separated(
          separatorBuilder: (_, __) => SizedBox(height: 4.w),

          itemCount: 20,
          itemBuilder:
              (_, index) => LayoutBuilder(
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
                            Image.asset(
                              Assets.testDemo,
                              height: size.maxWidth * 0.35,
                            ),
                            SizedBox(
                              height: size.maxWidth*0.05,
                            ),
                            Text(
                              'عيار 24',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gold/core/utils/app_padding.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.child, this.color, this.borderColor});

  final Widget? child;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: AppPadding.instance.horizontalPadding(AppPadding.instance.p12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: AppPadding.instance.verticalPadding(AppPadding.instance.p16),
            child: child,
          ),
        ),
      ),
    );
  }
}

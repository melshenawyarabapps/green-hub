import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class CreateOrderContainer extends StatelessWidget {
  const CreateOrderContainer({super.key, required this.child, this.verticalPadding = 20});

  final Widget child;
  final double verticalPadding;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 20.w,
          vertical: verticalPadding.h
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

class OrderItemInformation extends StatelessWidget {
  const OrderItemInformation({
    super.key,
    required this.iconPath,
    required this.value,
    this.leading = const SizedBox.shrink(),
  });
  final String iconPath;
  final String value;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundColor: context.theme.primaryColor.withValues(
            alpha: 0.1,
          ),
          child: CustomSvgBuilder(
            path: iconPath,
            color: context.theme.primaryColor,
            width: 12.w,
            height: 12.h,
            fit: BoxFit.contain,
          ),
        ),
        4.horizontalSpace,
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        2.horizontalSpace,
        leading,
      ],
    );
  }
}

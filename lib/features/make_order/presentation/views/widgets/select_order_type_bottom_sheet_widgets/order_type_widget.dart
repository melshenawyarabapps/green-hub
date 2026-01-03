import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class OrderTypeWidget extends StatelessWidget {
  const OrderTypeWidget({
    super.key,
    required this.isSelected,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final bool isSelected;
  final String imagePath;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: AppPadding.hvPadding(
          horizontal: 8,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 0),
                    ),
                  ]
                  : [],
          border: Border.all(
            color: isSelected ? context.theme.primaryColor : Colors.grey.shade400,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 92.h,
                width: 152.w,
                fit: BoxFit.fill,
              ),
            ),
            10.verticalSpace,
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: isSelected ? null : Colors.grey.shade600,
              ),
            ),
            4.verticalSpace,
            Text(
              subTitle,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 8,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

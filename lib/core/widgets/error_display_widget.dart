import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({
    super.key,
    this.message,
    this.errorDetails,
    this.icon,
    this.iconSize,
  });

  final String? message;
  final String? errorDetails;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppPadding.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: iconSize ?? 64.sp,
              color: theme.colorScheme.error,
            ),
            16.verticalSpace,
            Text(
              message ?? '',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (errorDetails != null) ...[
              8.verticalSpace,
              Text(
                errorDetails!,
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

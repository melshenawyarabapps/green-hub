import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class CustomVechileSizeWidget extends StatelessWidget {
  const CustomVechileSizeWidget({
    super.key,
    required this.size,
    required this.fontColor,
    this.leading,
  });

  final String size;
  final Color fontColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: fontColor.withValues(
          alpha: 0.2,
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: fontColor,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            4.horizontalSpace,
          ],
          Text(
            size,
            style: context.textTheme.labelMedium!.copyWith(
              color: fontColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.isRead,
    required this.iconPath,
    required this.title,
    required this.body,
    required this.timeAgo,
  });

  final bool isRead;
  final String iconPath;
  final String title;
  final String body;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    const unReadColor = Color(0xff048372);
    return Container(
      padding: AppPadding.all(12.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: isRead ? theme.scaffoldBackgroundColor : unReadColor.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isRead ? Colors.transparent : unReadColor.withValues(alpha: 0.08),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56.h,
            height: 56.h,
            padding: AppPadding.all(12.w),
            decoration: BoxDecoration(
              color: isRead ? AppLightColors.greyColor2 : theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(
              iconPath,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    if (!isRead)
                      const CircleAvatar(
                        radius: 4,
                        backgroundColor: Color(0xffAECF5C),
                      ),
                  ],
                ),
                4.verticalSpace,
                Text(
                  body,
                  style: theme.textTheme.labelSmall,
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.h,
                      padding: AppPadding.all(4.w),
                      decoration: BoxDecoration(
                        color: unReadColor.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: const CustomSvgBuilder(path: Assets.svgsClock),
                    ),
                    4.horizontalSpace,
                    Text(
                      timeAgo,
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

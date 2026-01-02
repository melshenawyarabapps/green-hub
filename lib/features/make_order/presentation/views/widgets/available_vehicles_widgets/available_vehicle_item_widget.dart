import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class AvailableVehicleItemWidget extends StatelessWidget {
  const AvailableVehicleItemWidget({
    super.key,
    required this.title,
    required this.size,
    required this.imagePath,
    required this.backgroundColor,
    this.fontColor = const Color(0xffAECF5C),
  });

  final String title;
  final String size;
  final String imagePath;
  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.05,
            ),
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: AppPadding.verticalPadding(24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              height: 74.h,
              width: 74.w,
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall!.copyWith(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Container(
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
                child: Text(
                  size,
                  style: context.textTheme.labelMedium!.copyWith(
                    color: fontColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

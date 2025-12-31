import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonColor,
    this.onPressed,
  });

  final String title;
  final String description;
  final String imagePath;
  final Color buttonColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.hvPadding(
        horizontal: 8,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 92.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          10.verticalSpace,
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppLightColors.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          Text(
            description,
            style: context.textTheme.labelSmall!.copyWith(
              fontSize: 10.sp,
            ),
          ),
          const SizedBox(height: 12),
          AppElevatedButton(
            onPressed: () {
              log('${LocaleKeys.createOrdinaryOrder.tr()} pressed');
            },
            title: LocaleKeys.createOrdinaryOrder.tr(),
            color: buttonColor,
          ),
        ],
      ),
    );
  }
}

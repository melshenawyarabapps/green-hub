import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/utils/app_padding.dart';

class BoardingPageContent extends StatelessWidget {
  final int pageIndex;

  const BoardingPageContent({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        // Background Image
        Image.asset(
          'assets/images/boarding${pageIndex + 1}.png',
          width: 375.w,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        // Bottom Content
        PositionedDirectional(
          bottom: 32.h,
          start: 0,
          end: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with animation
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: AppPadding.horizontalPadding(AppPadding.p24),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppConfig.instance.currentFlavor}BoardingTitle${pageIndex + 1}1'.tr(),
                      style: textTheme.titleLarge,
                      children: [
                        TextSpan(
                          text: '${AppConfig.instance.currentFlavor}BoardingTitle${pageIndex + 1}2'.tr(),
                          style: textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: '${AppConfig.instance.currentFlavor}BoardingTitle${pageIndex + 1}3'.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
              // Description with animation
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: AppPadding.horizontalPadding(AppPadding.p16),
                  child: Text(
                    '${AppConfig.instance.currentFlavor}BoardingDescription${pageIndex + 1}'.tr(),
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              120.verticalSpace, // Space for fixed button
            ],
          ),
        ),
      ],
    );
  }
}


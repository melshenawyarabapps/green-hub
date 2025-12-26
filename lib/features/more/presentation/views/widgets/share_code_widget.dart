import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';

class ShareCodeWidget extends StatelessWidget {
  const ShareCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      width: 335.w,
      height: 32.h,
      margin: AppPadding.onlyPadding(bottom: AppPadding.p16),
      decoration: decorations?.selectedDecoration.copyWith(
        borderRadius: AppRadius.all(AppRadius.r16),
      ),
      padding: AppPadding.horizontalPadding(AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.shareCode.tr(),
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeights.bold,
              fontSize: FontSizes.s8,
            ),
          ),
          Container(
            width: 75.w,
            height: 24.h,
            decoration: decorations?.secondaryDecoration.copyWith(
              borderRadius: AppRadius.all(AppRadius.r12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '#141414',
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: FontSizes.s9,
                    fontWeight: FontWeights.semiBold,
                  ),
                ),
                2.horizontalSpace,
                Icon(
                  Icons.copy,
                  size: AppRadius.r10,
                  color: decorations?.borderWhiteDecoration.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
    required this.userName,
    required this.location,
    this.onEditPressed,
  });

  final String userName;
  final String location;
  final VoidCallback? onEditPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      width: double.infinity,
      padding: AppPadding.horizontalPadding(AppPadding.p16),
      height: 90.h,
      decoration: decorations?.profileDecoration,
      alignment: Alignment.center,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userName,
                style: textTheme.bodySmall?.copyWith(
                  fontSize: FontSizes.s16,
                  fontWeight: FontWeights.semiBold,
                ),
              ),
              4.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Assets.svgsLocation,
                    color: theme.primaryColor,
                    height: 12.h,
                    width: 12.h,
                  ),
                  4.horizontalSpace,
                  Text(
                    location,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: FontSizes.s10,
                      fontWeight: FontWeights.regular,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: onEditPressed,
            child: Container(
              width: 81.w,
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: decorations?.borderWhiteDecoration.color,
                borderRadius: AppRadius.all(AppRadius.r16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.edit.tr(),
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: FontSizes.s10,
                      fontWeight: FontWeights.medium,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  4.horizontalSpace,
                  SvgPicture.asset(Assets.svgsEdit, height: 16.h, width: 16.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

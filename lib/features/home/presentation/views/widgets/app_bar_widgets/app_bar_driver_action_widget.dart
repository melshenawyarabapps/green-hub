import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/features/home/presentation/views/widgets/app_bar_widgets/app_bar_grediant_container.dart';

import '../../../../../../generated/assets.dart';

class AppBarDriverActionWidget extends StatelessWidget {
  const AppBarDriverActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final theme = context.theme;
    return AppBarGradientContainer(
      child: Row(
        children: [
          Text(
            LocaleKeys.emergencyContact.tr(),
            style: textTheme.bodySmall!.copyWith(color: theme.scaffoldBackgroundColor),
          ),
          const Spacer(),
          Container(
            padding: AppPadding.hvPadding(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.error,
              borderRadius: BorderRadius.circular(250),
            ),
            child: Row(
              children: [
                Text(
                  '1158',
                  style: textTheme.bodySmall!.copyWith(
                    color: theme.scaffoldBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                6.horizontalSpace,
                const CustomSvgBuilder(
                  path: Assets.svgsAllert,
                  height: 14,
                  width: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

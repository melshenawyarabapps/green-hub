import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/app_radius.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class BarWidget extends StatelessWidget {
  const BarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();

    return SafeArea(
      child: Padding(
        padding: AppPadding.horizontalPadding(AppPadding.p24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBackButton(),
            Container(
              padding: AppPadding.hvPadding(
                height: AppPadding.p8,
                width: AppPadding.p12,
              ),
              decoration: BoxDecoration(
                color: decorations?.borderWhite20Decoration.color,
                borderRadius: AppRadius.all(AppRadius.r8),
              ),
              child: Row(
                children: [
                  Image.asset(Assets.iconsEn, width: 33.w, height: 22.h),
                  4.horizontalSpace,
                  Text("EN", style: textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/show_bottom_sheet_manager.dart';
import 'package:greenhub/core/widgets/notch_widget.dart';

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    required this.title,
    this.subTitle,
    this.footer,
  });

  final String title;
  final String? subTitle;
  final Widget? footer;

  static Future show(
    context, {
    bool enableDrag = false,
    bool isDismissible = true,
    required String title,
    String? subTitle,
    Widget? footer,
  }) async {
    await ShowBottomSheetManager.showSuccess(
      context,
      title: title,
      subTitle: subTitle,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      footer: footer,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      height: 381.h,
      width: double.infinity,
      decoration: decorations?.borderWhiteDecoration,
      child: Column(
        children: [
          Padding(
            padding: AppPadding.horizontalPadding(AppPadding.p32),
            child: Column(
              children: [
                const NotchWidget(),
                16.verticalSpace,
                SvgPicture.asset(Assets.svgsSuccess),
                24.verticalSpace,
                Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(fontSize: FontSizes.s24),
                ),
                if (subTitle != null) ...[
                  24.verticalSpace,
                  Text(
                    subTitle!,
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          if (footer != null)
            Padding(
              padding:AppPadding.horizontalPadding(16),
              child: Column(
                children: [
                  30.verticalSpace,
                  footer!,
                  24.verticalSpace,
                ],
              ),
            ),
        ],
      ),
    );
  }
}

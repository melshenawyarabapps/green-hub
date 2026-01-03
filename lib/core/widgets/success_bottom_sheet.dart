import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/widgets/notch_widget.dart';

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    required this.title,
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  static Future show(
    context, {
    bool enableDrag = false,
    bool isDismissible = true,
    required String title,
    String? subTitle,
  }) async {
    await showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder:
          (_) => SuccessBottomSheet(
            title: title,
            subTitle: subTitle,
          ),
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
    );
  }
}

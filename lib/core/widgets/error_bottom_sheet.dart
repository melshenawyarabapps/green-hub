import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/notch_widget.dart';

class ErrorBottomSheet extends StatelessWidget {
  const ErrorBottomSheet({
    super.key,
    required this.title,
    this.subTitle,
    this.elevatedText,
    this.text,
    this.elevatedPressed,
    this.textPressed,
  });

  final String title;
  final String? subTitle;
  final String? elevatedText;
  final String? text;
  final VoidCallback? elevatedPressed;
  final VoidCallback? textPressed;

  static show(
    context, {
    bool enableDrag = false,
    bool isDismissible = true,
    required String title,
    String? subTitle,
    String? elevatedText,
    String? text,
    VoidCallback? elevatedPressed,
    VoidCallback? textPressed,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: true,
      builder:
          (_) => ErrorBottomSheet(
            title: title,
            elevatedPressed: elevatedPressed,
            elevatedText: elevatedText,
            subTitle: subTitle,
            text: text,
            textPressed: textPressed,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      height: 501.h,
      width: double.infinity,
      decoration: decorations?.borderWhiteDecoration,
      padding: AppPadding.horizontalPadding(AppPadding.p32),
      child: Column(
        children: [
          const NotchWidget(),
          16.verticalSpace,
          SvgPicture.asset(Assets.svgsError),
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
          if (elevatedText != null) ...[
            32.verticalSpace,
            AppElevatedButton(title: elevatedText!, onPressed: elevatedPressed),
          ],
          if (text != null) ...[
            24.verticalSpace,
            AppTextButton.black(title: text!, onPressed: textPressed),
          ],
        ],
      ),
    );
  }
}

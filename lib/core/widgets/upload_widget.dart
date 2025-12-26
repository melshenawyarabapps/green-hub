import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenhub/core/generated/assets.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/font_sizes.dart';
import 'package:greenhub/core/utils/font_weights.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key, required this.title, this.isChoose = false});

  final String title;
  final bool isChoose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: textTheme.bodySmall),
            if (isChoose)
              Text(LocaleKeys.choose.tr(), style: textTheme.labelSmall),
          ],
        ),
        12.verticalSpace,
        Container(
          height: 125.h,
          width: 335.w,
          decoration: decorations?.grayDecoration,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(Assets.svgsDocumentUpload),
              Text(
                LocaleKeys.uploadPhoto.tr(),
                style: textTheme.bodySmall?.copyWith(
                  fontSize: FontSizes.s14,
                  fontWeight: FontWeights.semiBold,
                ),
              ),
              Text(
                LocaleKeys.uploadPhotDescription.tr(),
                style: textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

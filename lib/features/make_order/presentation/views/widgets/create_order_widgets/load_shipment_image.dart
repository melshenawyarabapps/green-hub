import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class LoadShipmentImage extends StatelessWidget {
  const LoadShipmentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.uploadShipmentImages.tr(),
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: AppLightColors.greyColor2,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppLightColors.greyColor5,

              width: 1,
            ),
          ),
          child: Column(
            children: [
              const CustomSvgBuilder(
                path: Assets.svgsDocumentUpload,
              ),
              12.verticalSpace,
              Text(
                LocaleKeys.uploadTheImageHere.tr(),
                style: context.primaryTextTheme.titleMedium,
              ),
              8.verticalSpace,
              Text(
                '${LocaleKeys.availableFormats.tr()} : JPEG, PNG, PDF, Word, PPT',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

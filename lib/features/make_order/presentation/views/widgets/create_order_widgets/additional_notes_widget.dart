import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';
import 'package:greenhub/generated/assets.dart';

class AdditionalNotesWidget extends StatelessWidget {
  const AdditionalNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.additionalNotes.tr(),
          style: context.textTheme.headlineSmall,
        ),
        12.verticalSpace,
        AppTextFormField(
          hintText: LocaleKeys.writeAdditionalNotesHere.tr(),
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: AppPadding.verticalPadding(12),
                child: const CustomSvgBuilder(
                  path: Assets.svgsAdditionalNotes,
                  fit: BoxFit.contain,
                ),
              ),
              60.verticalSpace,
            ],
          ),
          radius: 8,
          maxLines: 5,
          minLines: 5,
        ),
      ],
    );
  }
}

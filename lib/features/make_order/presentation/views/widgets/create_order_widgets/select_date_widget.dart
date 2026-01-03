import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/custom_svg_builder.dart';

import '../../../../../../generated/assets.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.date,
          style: context.textTheme.headlineSmall,
        ),
        16.verticalSpace,
        AppTextFormField(
          hintText: LocaleKeys.selectDate.tr(),
          suffixIcon: Padding(
            padding: AppPadding.verticalPadding(
              12.h,
            ),
            child: const CustomSvgBuilder(
              path: Assets.svgsCalendar,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

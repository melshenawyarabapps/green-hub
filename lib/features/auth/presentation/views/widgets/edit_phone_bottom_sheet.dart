import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/themes/theme_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/app_text_form_field.dart';
import 'package:greenhub/core/widgets/country_widget.dart';

class EditPhoneBottomSheet extends StatelessWidget {
  const EditPhoneBottomSheet({super.key});

  static show(context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) => const EditPhoneBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final decorations = theme.extension<AppDecorations>();
    return Container(
      decoration: decorations?.borderWhite20Decoration,
      padding: AppPadding.onlyPadding(top: AppPadding.p12),
      margin: AppPadding.onlyPadding(bottom: context.bottomPadding),
      child: Container(
        height: 361.h,
        width: double.infinity,
        decoration: decorations?.borderWhiteDecoration,
        padding: AppPadding.horizontalPadding(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.verticalSpace,
            Text(LocaleKeys.changePhone.tr(), style: textTheme.bodyMedium),
            32.verticalSpace,
            AppTextFormField(
              hintText: LocaleKeys.phoneNumber.tr(),
              prefixIcon: const CountryWidget(),
              keyboardType: TextInputType.number,
              maxLength: 9,
              prefixWidth: 90.w,
              validator: (value) {
                final validator = value.validateNumber;
                if (validator != null) {
                  return validator.tr();
                }
                return null;
              },
            ),
            56.verticalSpace,
            AppElevatedButton(
              title: LocaleKeys.yes.tr(),
              onPressed: ()  {
                context.pop();
              },
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextButton.black(
                  title: LocaleKeys.back.tr(),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

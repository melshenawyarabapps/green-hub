import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/edit_phone_bottom_sheet.dart';

class ChangePhoneSection extends StatelessWidget {
  const ChangePhoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.youNeedChangePhone.tr(),
          style: textTheme.displayLarge,
        ),
        AppTextButton.primary(
          title: LocaleKeys.changePhone.tr(),
          onPressed: () {
            EditPhoneBottomSheet.show(context);
          },
        ),
      ],
    );
  }
}


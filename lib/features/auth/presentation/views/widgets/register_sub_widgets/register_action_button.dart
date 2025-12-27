import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';

class RegisterActionButton extends StatelessWidget {
  final bool isUser;

  const RegisterActionButton({
    super.key,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          title: isUser ? LocaleKeys.saveData.tr() : LocaleKeys.next.tr(),
          onPressed: () async {
            if (isUser) {
              context.pushNamedAndRemoveUntil(
                AppRoutes.navigationView,
              );
            } else {
              await SuccessBottomSheet.show(
                context,
                title: LocaleKeys.registerSuccessfully.tr(),
                subTitle: LocaleKeys.registerSuccessfullyDescription.tr(),
              );
              context.pushNamedAndRemoveUntil(
                AppRoutes.navigationView,
              );
            }
          },
        ),
        24.verticalSpace,
      ],
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/show_bottom_sheet_manager.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/success_bottom_sheet.dart';

class VerificationActions extends StatelessWidget {
  const VerificationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.verticalSpace,
        AppElevatedButton(
          title: LocaleKeys.loginAction.tr(),
          onPressed: () async {
            final isUser = context.isUser;
            ShowBottomSheetManager.showSuccess(
              context,
              title: LocaleKeys.loginSuccessfully.tr(),
              enableDrag: true,
            ).whenComplete(() {
              if (isUser) {
                context.pushNamedAndRemoveUntil(
                  AppRoutes.navigationView,
                );
              } else {
                context.pushReplacementNamed(
                  AppRoutes.faceIdView,
                );
              }
            });
            // SuccessBottomSheet.show(
            //   context,
            //   enableDrag: true,
            //   isDismissible: true,
            //   title: LocaleKeys.loginSuccessfully.tr(),
            //   subTitle: isUser
            //       ? LocaleKeys.loginSuccessfullyDescription.tr()
            //       : LocaleKeys.loginSuccessfullyDescriptionDelivery.tr(),
            // ).then((_) {
            //
            // });
          },
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextButton.black(
              title: LocaleKeys.returnToLogin.tr(),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}

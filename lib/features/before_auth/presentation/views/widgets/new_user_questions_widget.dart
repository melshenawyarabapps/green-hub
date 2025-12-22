import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/config/app_config.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/extensions/string_extensions.dart';
import 'package:greenhub/core/routing/app_routes.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';

class NewUserQuestionsWidget extends StatelessWidget {
  const NewUserQuestionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${AppConfig.instance.currentFlavor}New'.tr(),
          style: textTheme.bodyMedium,
        ),
        32.verticalSpace,

        AppElevatedButton(
          title: LocaleKeys.yesNew.tr(),
          onPressed: () {
            context.pushNamed(
              AppConfig.instance.currentFlavor.isUser
                  ? AppRoutes.registerView
                  : AppRoutes.beforeRegisterView,
            );
          },
        ),
        16.verticalSpace,
        AppOutlinedButton(
          title: LocaleKeys.no.tr(),
          onPressed: () {
            context.pushNamed(AppRoutes.loginView);
          },
        ),
      ],
    );
  }
}

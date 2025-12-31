import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/widgets/app_buttons.dart';
import 'package:greenhub/core/widgets/empty_list_widget.dart';

import '../../../../../generated/assets.dart';

class EmptyNotificationWidget extends StatelessWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmptyListWidget(
          imagePath: Assets.imagesEmptyNotificationList,
          title: LocaleKeys.noNewNotifications.tr(),
          subTitle: LocaleKeys.youHaveNoNewNotificationsAtTheMoment.tr(),
        ),
        48.verticalSpace,
        AppElevatedButton(
          onPressed: () {
            context.pop();
          },
          color: Theme.of(context).primaryColor,
          title: LocaleKeys.backToMain.tr(),
        ),
      ],
    );
  }
}

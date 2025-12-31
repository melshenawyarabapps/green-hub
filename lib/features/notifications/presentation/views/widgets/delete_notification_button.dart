import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_padding.dart';
import '../../cubit/notification_cubit.dart';

class DeleteNotificationButton extends StatelessWidget {
  const DeleteNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Clear all notifications
        context.read<NotificationCubit>().clearAllNotifications();
      },
      child: Container(
        padding: AppPadding.all(11.5.w),
        margin: const EdgeInsetsDirectional.only(end: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          gradient: const LinearGradient(
            colors: [
              Color(0xffABCF83),
              Color(0xffB9D580),
            ],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          ),
        ),
        child: Text(
          LocaleKeys.deleteAll.tr(),
          style: context.textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

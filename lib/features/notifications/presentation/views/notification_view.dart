import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenhub/core/extensions/context_extensions.dart';
import 'package:greenhub/core/translations/locale_keys.g.dart';
import 'package:greenhub/core/utils/app_colors.dart';
import 'package:greenhub/core/widgets/app_gradient_widget.dart';
import 'package:greenhub/core/widgets/custom_back_button_widget.dart';
import 'package:greenhub/features/auth/presentation/views/widgets/register_sub_widgets/register_form_container.dart';
import 'package:greenhub/features/notifications/presentation/views/widgets/empty_notification_widget.dart';
import '../cubit/notification_cubit.dart';
import '../cubit/notification_state.dart';
import 'package:greenhub/features/notifications/data/models/notification_model.dart';
import 'package:greenhub/features/notifications/presentation/views/widgets/delete_notification_button.dart';
import 'package:greenhub/features/notifications/presentation/views/widgets/notification_item_widget.dart';
import 'package:greenhub/generated/assets.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              NotificationCubit()..loadNotifications([
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsConfirmedNotification,
                  title: 'تم تأكيد طلبك ✅',
                  body: 'السائق في طريقه لاستلام الشحنة.',
                  timeAgo: 'قبل 10 دقائق',
                  dateTime: DateTime.now(),
                ),
                NotificationModel(
                  isRead: true,
                  iconPath: Assets.iconsGiftNotification,
                  body: 'احصل على خصم 20% عند استخدام InstaPay للدفع اليوم فقط!',
                  title: 'عرض خاص لك! 🎉',
                  timeAgo: 'من ساعة واحدة',
                  dateTime: DateTime.now(),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsSettingsNotification,
                  body: 'احصل على خصم 20% عند استخدام InstaPay للدفع اليوم فقط!',
                  title: 'عرض خاص لك! 🎉',
                  timeAgo: 'من ساعة واحدة',
                  dateTime: DateTime.now(),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsConfirmedNotification,
                  title: 'تم تأكيد طلبك ✅',
                  body: 'إذا لم تكن أنت من قام بهذا التحديث، يرجى مراجعة إعدادات الأمان فورًا.',
                  timeAgo: 'قبل 10 دقائق',
                  dateTime: DateTime.now(),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsGiftNotification,
                  body: 'احصل على خصم 20% عند استخدام InstaPay للدفع اليوم فقط!',
                  title: 'عرض خاص لك! 🎉',
                  timeAgo: 'من ساعة واحدة',
                  dateTime: DateTime.now().subtract(const Duration(days: 1)),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsConfirmedNotification,
                  title: 'تم تأكيد طلبك ✅',
                  body: 'إذا لم تكن أنت من قام بهذا التحديث، يرجى مراجعة إعدادات الأمان فورًا.',
                  timeAgo: 'قبل 10 دقائق',
                  dateTime: DateTime.now().subtract(const Duration(days: 2)),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsGiftNotification,
                  body: 'احصل على خصم 20% عند استخدام InstaPay للدفع اليوم فقط!',
                  title: 'عرض خاص لك! 🎉',
                  timeAgo: 'من ساعة واحدة',
                  dateTime: DateTime.now().subtract(const Duration(days: 2)),
                ),
                NotificationModel(
                  isRead: false,
                  iconPath: Assets.iconsConfirmedNotification,
                  title: 'تم تأكيد طلبك ✅',
                  body: 'إذا لم تكن أنت من قام بهذا التحديث، يرجى مراجعة إعدادات الأمان فورًا.',
                  timeAgo: 'قبل 10 دقائق',
                  dateTime: DateTime.now().subtract(const Duration(days: 3)),
                ),
              ]),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                LocaleKeys.notifications.tr(),
                style: context.textTheme.headlineLarge,
              ),
              leadingWidth: 86,
              leading: const CustomBackButtonWidget(),
              actions: const [
                DeleteNotificationButton(),
              ],
            ),
            body: Stack(
              children: [
                const Positioned.fill(child: AppGradientWidget()),
                RegisterFormContainer(
                  height: context.screenHeight - context.topPadding - kToolbarHeight - 64.h,
                  child:
                      state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : (state.todayNotifications.isEmpty && state.laterNotifications.isEmpty)
                          ? const EmptyNotificationWidget()
                          : ListView(
                            padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
                            children: [
                              if (state.todayNotifications.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                                  child: Text(
                                    'اليوم',
                                    style: context.textTheme.bodySmall!.copyWith(
                                      color: AppLightColors.greyColor,
                                    ),
                                  ),
                                ),
                                ...state.todayNotifications.map(
                                  (n) => NotificationItemWidget(
                                    isRead: n.isRead,
                                    iconPath: n.iconPath,
                                    title: n.title,
                                    body: n.body,
                                    timeAgo: n.timeAgo,
                                  ),
                                ),
                              ],
                              if (state.laterNotifications.isNotEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                                  child: Text(
                                    'لاحقًا',
                                    style: context.textTheme.bodySmall!.copyWith(
                                      color: AppLightColors.greyColor,
                                    ),
                                  ),
                                ),
                                ...state.laterNotifications.map(
                                  (n) => NotificationItemWidget(
                                    isRead: n.isRead,
                                    iconPath: n.iconPath,
                                    title: n.title,
                                    body: n.body,
                                    timeAgo: n.timeAgo,
                                  ),
                                ),
                              ],
                            ],
                          ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

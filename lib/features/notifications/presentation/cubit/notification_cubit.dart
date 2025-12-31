import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  void loadNotifications(List<NotificationModel> notifications) {
    emit(state.copyWith(isLoading: true));
    try {
      final now = DateTime.now();
      final today = <NotificationModel>[];
      final later = <NotificationModel>[];
      for (final n in notifications) {
        if (_isToday(n.dateTime, now)) {
          today.add(n);
        } else {
          later.add(n);
        }
      }
      emit(state.copyWith(
        todayNotifications: today,
        laterNotifications: later,
        isLoading: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void clearAllNotifications() {
    emit(state.copyWith(
      todayNotifications: [],
      laterNotifications: [],
      isLoading: false,
      error: null,
    ));
  }

  static bool _isToday(DateTime date, DateTime now) {
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }
}

import 'package:equatable/equatable.dart';
import '../../data/models/notification_model.dart';

class NotificationState extends Equatable {
  final List<NotificationModel> todayNotifications;
  final List<NotificationModel> laterNotifications;
  final bool isLoading;
  final String? error;

  const NotificationState({
    this.todayNotifications = const [],
    this.laterNotifications = const [],
    this.isLoading = false,
    this.error,
  });

  NotificationState copyWith({
    List<NotificationModel>? todayNotifications,
    List<NotificationModel>? laterNotifications,
    bool? isLoading,
    String? error,
  }) {
    return NotificationState(
      todayNotifications: todayNotifications ?? this.todayNotifications,
      laterNotifications: laterNotifications ?? this.laterNotifications,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [todayNotifications, laterNotifications, isLoading, error];
}


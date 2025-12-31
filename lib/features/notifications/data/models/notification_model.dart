class NotificationModel {
  final bool isRead;
  final String iconPath;
  final String title;
  final String body;
  final String timeAgo;
  final DateTime dateTime;

  NotificationModel({
    required this.isRead,
    required this.iconPath,
    required this.title,
    required this.body,
    required this.timeAgo,
    required this.dateTime,
  });

  NotificationModel copyWith({
    bool? isRead,
    String? iconPath,
    String? title,
    String? body,
    String? timeAgo,
    DateTime? dateTime,
  }) {
    return NotificationModel(
      isRead: isRead ?? this.isRead,
      iconPath: iconPath ?? this.iconPath,
      title: title ?? this.title,
      body: body ?? this.body,
      timeAgo: timeAgo ?? this.timeAgo,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}

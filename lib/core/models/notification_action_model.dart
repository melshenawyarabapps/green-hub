import 'package:equatable/equatable.dart';
import 'package:gold/core/enums/notifications_enums.dart';

class NotificationActionModel extends Equatable {
  final NotificationActionType action;

  const NotificationActionModel({
    required this.action,
  });

  factory NotificationActionModel.fromJson( json) {
    final action = json['type'] ?? '';
    return NotificationActionModel(
      action: action.isEmpty
          ? NotificationActionType.none
          : NotificationActionType.values
              .byName(action.toString().toLowerCase()),
    );
  }

  @override
  List<Object?> get props => [action];
}

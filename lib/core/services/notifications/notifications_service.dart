import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gold/core/enums/notifications_enums.dart';
import 'package:gold/core/models/notification_action_model.dart';
import 'package:gold/core/services/logger/app_logger.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  AppLogger.instance.debug('_firebaseMessagingBackgroundHandler : ${message.toMap()}');
}

@pragma('vm:entry-point')
Future<void> _onDidReceiveBackgroundNotificationResponse(
  NotificationResponse response,
) async {
  AppLogger.instance.debug('_onDidReceiveBackgroundNotificationResponse : ${response.payload}');
}

abstract class NotificationsService {


  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static const _channel = AndroidNotificationChannel(
    'notify', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('notification'),
  );

  static Future<void> init() async {
    await _requestPermissions();
    await _initLocalNotifications();
    await _getInitialLink();
    _messagingListener();
  }

  static Future<void> _requestPermissions() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      await FirebaseMessaging.instance.subscribeToTopic(
        NotificationActionType.all.name,
      );
    } catch (_) {}
  }

  static void _messagingListener() {
    FirebaseMessaging.onMessage.listen(_showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      AppLogger.instance.debug('onMessageOpenedApp : ${event.toMap()}');
      _notificationActions(NotificationActionModel.fromJson(event.data));
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static _initLocalNotifications() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        AppLogger.instance.debug('onDidReceiveNotificationResponse : ${response.payload}');
        final model = NotificationActionModel.fromJson(
          json.decode(response.payload ?? ''),
        );
        _notificationActions(model);
      },
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotificationResponse,
    );
    if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(_channel);
    }
  }

  static void _showFlutterNotification(RemoteMessage message) async {
    AppLogger.instance.debug('_showFlutterNotification : ${message.data}');
    RemoteNotification? notification = message.notification;
    Uint8List? largeIcon;
    if (notification?.android?.imageUrl != null) {
      try {
        largeIcon =
            (await NetworkAssetBundle(
              Uri.parse(notification!.android!.imageUrl!),
            ).load(notification.android!.imageUrl!)).buffer.asUint8List();
      } catch (_) {}
    }
    if (notification != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            largeIcon:
                largeIcon != null ? ByteArrayAndroidBitmap(largeIcon) : null,
            playSound: true,
            sound: const RawResourceAndroidNotificationSound('notification'),
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentSound: true,
            sound: 'notification.wav',
            attachments:
                largeIcon != null
                    ? [
                      DarwinNotificationAttachment(
                        File.fromRawPath(largeIcon).path,
                      ),
                    ]
                    : null,
          ),
        ),
        payload: json.encode(message.data),
      );
    }
  }

  static void _notificationActions(NotificationActionModel model) {
    AppLogger.instance.debug('_notificationActions : ${model.action}');
    switch (model.action) {
      default:
        break;
    }
  }

  static Future<void> _getInitialLink() async {
    final lastNotification =
        await FirebaseMessaging.instance.getInitialMessage();
    if (lastNotification != null) {
      _notificationActions(
        NotificationActionModel.fromJson(lastNotification.data),
      );
    }
  }

}

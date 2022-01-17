import 'dart:io';

import 'package:device_info/device_info.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rxdart/subjects.dart';

import '../../../features/common/constants/assets_constants.dart';
import '../../../features/presentation/components/utility/palette.dart';
import '../plugins/notification_plugin.dart';

///[fcm] notifications service
class NotificationService {
  final deviceInfo = DeviceInfoPlugin();

  /// * make increment when notification is exist
  /// * in case if without message id, current notification will replace by new notification
  int messageId = 0;

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject<ReceivedNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  /// * setup notifiation for android setting,
  /// * will show large avatar make sure add [largeicon] constructor
  ///
  static const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          MyNotificationConstant.channelId, MyNotificationConstant.channelName,
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          enableLights: true,
          channelShowBadge: true,
          color: Palette.primaryColor,
          enableVibration: true,
          fullScreenIntent: true,
          groupKey: MyNotificationConstant.groupKey);

  /// * setup ios notification
  ///
  static const IOSNotificationDetails iosNotificationDetails =
      IOSNotificationDetails(
          badgeNumber: 1,
          presentSound: true,
          presentAlert: true,
          presentBadge: true);

  final platformChannelSpecifics = const NotificationDetails(
    android: androidNotificationDetails,
    iOS: iosNotificationDetails,
  );

  Future initialize() async {
    final fcm = FirebaseMessaging.instance;

    /// * Initialization fcm token from generate by device
    ///
    FirebaseMessaging.instance.getToken().then((value) {
      print("FCM TOKEN :$value");
    });

    /// * setup notification permission on iOS, in case android not need permission
    ///
    NotificationSettings settings = await fcm.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    /// * get response granted or not granted by user on notification permission
    ///
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    /// * setting android icon notificaiton by assets name id drawable
    ///
    const AndroidInitializationSettings settingsAndroid =
        AndroidInitializationSettings('notification');

    /// * setup iOS setting in initialization notification badge and other
    ///
    final IOSInitializationSettings settingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int? id, String? title, String? body, String? payload) async {
          didReceiveLocalNotificationSubject.add(ReceivedNotification(
              id: id, title: title, body: body, payload: payload));
        });

    /// * finaly initialization notification both android or iOS
    ///
    final InitializationSettings initializationSettings =
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS);

    /// * this function is callable to initialization notification on another class
    /// in case call this on initial class user already login [home page] and [navigation]
    ///
    await notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      selectNotificationSubject.add(payload!);
    });

    /// * set foreground component show on notification
    ///
    await fcm.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    /// * initialitation firebase messaging
    ///
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        showNotifications(
          message,
          platformChannelSpecifics,
        );
      }
    });

    /// * To handle messages whilst the app is in the background or terminated,
    /// see [onBackgroundMessage].
    ///
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotifications(
        message,
        platformChannelSpecifics,
      );
    });

    /// * If your app is opened via a notification whilst the app is terminated,
    /// see [getInitialMessage].
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showNotifications(
        message,
        platformChannelSpecifics,
      );
    });
  }

  /// * get preferensi device type if show notification
  ///
  void showNotifications(dynamic message, NotificationDetails channel) {
    Platform.isAndroid
        ? showNotificationAndroid(message, channel)
        : showNotificationIos(message, channel);
  }

  /// * show notification on Android device
  ///
  Future<void> showNotificationAndroid(RemoteMessage message,
      NotificationDetails platformChannelSpecifics) async {
    messageId += 1;
    await notificationsPlugin.show(
      messageId,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }

  /// * show notification on iOS device
  ///
  Future<void> showNotificationIos(RemoteMessage message,
      NotificationDetails platformChannelSpecifics) async {
    messageId += 1;
    await notificationsPlugin.show(
      messageId,
      message.notification!.title,
      message.notification!.body,
      platformChannelSpecifics,
    );
  }

  /// * cancel all notification  by id
  ///
  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  /// * cancel all notification [clear notification]
  ///
  Future<void> cancelAllNotification() async {
    await notificationsPlugin.cancelAll();
  }
}

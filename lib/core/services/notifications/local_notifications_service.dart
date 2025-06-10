import 'dart:convert';
import 'dart:developer';

import 'package:chefio_app/core/services/notifications/models/my_notification_data_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final Dio _dio;

  LocalNotificationsService({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    required Dio dio,
  })  : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin,
        _dio = dio;

  Future<void> init({
    required Function(MyNotificationDataModel notificationData)
        onNotificationClick,
  }) async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        MyNotificationDataModel notificationData =
            MyNotificationDataModel.fromJson(
          jsonDecode(
            details.payload!,
          ),
        );
        onNotificationClick(notificationData);
      },
      onDidReceiveBackgroundNotificationResponse:
          handleBackgroundNotificationTap,
    );
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  @pragma('vm:entry-point')
  static handleBackgroundNotificationTap(
      NotificationResponse notificationResponse) {}

  Future<void> showBasicNotification(
      {required RemoteMessage remoteMessage}) async {
    BigPictureStyleInformation? bigPictureStyleInformation;
    bigPictureStyleInformation =
        await getNotificationImage(remoteMessage, bigPictureStyleInformation);

    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.max,
        styleInformation: bigPictureStyleInformation,
      ),
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      remoteMessage.notification?.title,
      remoteMessage.notification?.body,
      notificationDetails,
      payload: jsonEncode(remoteMessage.data),
    );
  }

  Future<BigPictureStyleInformation?> getNotificationImage(
      RemoteMessage remoteMessage,
      BigPictureStyleInformation? bigPictureStyleInformation) async {
    if (remoteMessage.notification?.android?.imageUrl != null) {
      _dio.options.responseType = ResponseType.bytes;
      final response =
          await _dio.get(remoteMessage.notification?.android?.imageUrl ?? '');
      bigPictureStyleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(base64Encode(response.data)),
        largeIcon: ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(response.data)),
      );
    }
    return bigPictureStyleInformation;
  }
}

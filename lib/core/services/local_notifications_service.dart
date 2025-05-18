import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  LocalNotificationsService({
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) : _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;

  Future<void> init() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
      onDidReceiveBackgroundNotificationResponse: handleBackgroundNotificationTap
    );
  }

  @pragma('vm:entry-point')
  static handleBackgroundNotificationTap(NotificationResponse notificationResponse){}

  Future<void> showBasicNotification() async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.max,
      ),
    );
    await _flutterLocalNotificationsPlugin.show(
      0,
      'eslam title',
      'eslam body',
      notificationDetails,
    );
  }
}

import 'dart:developer';
import 'package:chefio_app/core/services/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  final FirebaseMessaging _firebaseMessaging;
  final LocalNotificationsService _localNotificationsService;
  PushNotificationsService({
    required FirebaseMessaging firebaseMessaging,
    required LocalNotificationsService localNotificationsService,
  })  : _firebaseMessaging = firebaseMessaging,
        _localNotificationsService = localNotificationsService;

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    log('FCM Token: ${token ?? 'null token'}');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  @pragma('vm:entry-point')
  static Future<void> handleBackgroundMessage(
      RemoteMessage remoteMessage) async {
    await Firebase.initializeApp();
    log('🔔 Background message title: ${remoteMessage.notification?.title}');
  }
}

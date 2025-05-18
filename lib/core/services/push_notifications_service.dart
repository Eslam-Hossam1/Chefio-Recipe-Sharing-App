import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  final FirebaseMessaging _firebaseMessaging;

  PushNotificationsService({required FirebaseMessaging firebaseMessaging})
      : _firebaseMessaging = firebaseMessaging;

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

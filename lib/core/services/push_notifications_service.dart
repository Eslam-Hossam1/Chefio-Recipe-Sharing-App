import 'dart:developer';
import 'dart:ui';
import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/services/local_notifications_service.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  final FirebaseMessaging _firebaseMessaging;
  final LocalNotificationsService _localNotificationsService;
  final ApiConsumer _apiConsumer;
  final AuthCredentialsHelper _authCredentialsHelper;
  PushNotificationsService({
    required FirebaseMessaging firebaseMessaging,
    required LocalNotificationsService localNotificationsService,
    required ApiConsumer apiConsumer,
    required AuthCredentialsHelper authCredentialsHelper,
  })  : _firebaseMessaging = firebaseMessaging,
        _localNotificationsService = localNotificationsService,
        _apiConsumer = apiConsumer,
        _authCredentialsHelper = authCredentialsHelper;

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    await _localNotificationsService.init(
      onNotificationClick: handleForegroundMessageTap,
    );
    String? token = await _firebaseMessaging.getToken();
    log('FCM Token: ${token ?? 'null token'}');
    //when message arrive and the application in background state
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //show message that arrive when the application in foreground state
    showForgoundMessage();
  }

  Future<String?> getFcmToken() async {
    String? token = await _firebaseMessaging.getToken();
    return token;
  }

  handleForegroundMessageTap(payload) {
    log('Notification payload: $payload');
    AppRouter.router.go(RoutingHelper.getRecipeDetailsPath(recipeId: payload));
  }

  //when message arrive and the application opened
  showForgoundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) async {
      log('foreground message arrived ');
      await _localNotificationsService.showBasicNotification(
        remoteMessage: remoteMessage,
      );
    });
  }

  Future<void> sendFcmToken() async {
    await _apiConsumer.post(EndPoints.setFcmToken, data: {
      ApiKeys.fcmToken: await getFcmToken(),
    });
  }

  handleRefreshFcmToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen(
      (newFcmToken) {
        if (_authCredentialsHelper.userIsAuthenticated()) {
          _apiConsumer.post(EndPoints.setFcmToken, data: {
            ApiKeys.fcmToken: newFcmToken,
          });
        }
      },
    );
  }

  //handel when user tap on arrival notification in background and terminated state
  // It MUST be called in the `initState()` of the root widget (e.g., `ChefioApp`)
  // after the app is fully built and the navigation system is ready.
  Future<void> setupInteractedMessage() async {
    //hold remote message object (data) when user tap on notification when the app in the terminated state
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleInteractedMessage(initialMessage);
    }
    //stream give the remote message object (data) when user tap on notification when the app in background state
    FirebaseMessaging.onMessageOpenedApp.listen(handleInteractedMessage);
  }

  handleInteractedMessage(RemoteMessage remoteMessage) {
    if (getIt<AuthCredentialsHelper>().userIsAuthenticated()) {
      if (remoteMessage.data['type'] == 'like') {
        AppRouter.router.go(RoutingHelper.getRecipeDetailsPath(
            recipeId: remoteMessage.notification?.title ?? "null"));
      } else {
        //لسة هنشوف لما ال api يجهز
      }
    } else {
      log('from notification recipe id :${remoteMessage.notification?.title}');
      AppRouter.router.go(RoutePaths.login);
    }
  }

  // void handleInteractedMessage(RemoteMessage message) {
  //   //   if (message.data['type'] == 'chat') {}
  //   log('my handle notification , the notification : ${message.notification}');
  // }

  @pragma('vm:entry-point')
  static Future<void> handleBackgroundMessage(
      RemoteMessage remoteMessage) async {
    await Firebase.initializeApp();
    log('🔔 Background message title: ${remoteMessage.notification?.title}');
  }
}

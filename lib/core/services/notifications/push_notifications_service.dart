import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/helpers/notification_log_helper.dart';
import 'package:chefio_app/core/routing/app_router.dart';
import 'package:chefio_app/core/routing/routing_helper.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/services/notifications/local_notifications_service.dart';
import 'package:chefio_app/core/services/notifications/models/my_notification_data_model.dart';
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
    //when message arrive and the application in background state
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    //show message that arrive when the application in foreground state
    showForgoundMessage();
  }

  Future<String?> getFcmToken() async {
    String? token = await _firebaseMessaging.getToken();
    return token;
  }

  handleForegroundMessageTap(MyNotificationDataModel notificationData) {
    navigateBasedOnNotification(myNotificationDataModel: notificationData);
  }

  //when message arrive and the application opened
  showForgoundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) async {
      NotificationLogHelper.logRemoteNotification(remoteMessage: remoteMessage);
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
      MyNotificationDataModel myNotificationDataModel =
          MyNotificationDataModel.fromJson(
        remoteMessage.data,
      );
      navigateBasedOnNotification(
        myNotificationDataModel: myNotificationDataModel,
      );
    } else {
      AppRouter.router.go(RoutePaths.login);
    }
  }

  // This function is called when a background message is received.
  @pragma('vm:entry-point')
  static Future<void> handleBackgroundMessage(
      RemoteMessage remoteMessage) async {
    await Firebase.initializeApp();
    log('🔔 Background Message arrived: ${remoteMessage.notification}');
  }

  navigateBasedOnNotification(
      {required MyNotificationDataModel myNotificationDataModel}) {
    if (myNotificationDataModel.type == ApiKeys.notificationLikeType ||
        myNotificationDataModel.type == ApiKeys.notificationNewRecipeType) {
      AppRouter.router.go(
        RoutingHelper.getRecipeDetailsPath(
          recipeId: myNotificationDataModel.recipeId!,
        ),
      );
    } else {
      AppRouter.router.go(
        RoutingHelper.getProfilePath(
          chefId: myNotificationDataModel.senderId,
        ),
      );
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../firebase_options.dart';
import '../di/service_locator.dart';
import '../helpers/auth_credentials_helper.dart';
import '../services/notifications/push_notifications_service.dart';
import '../utils/app_bloc_observer.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await _setOrientation();
    await _initFirebase();
    await _initBlocObserverAndHydratedBloc();
    await _initEnv();
    await _initServiceLocator();
    await _initPushNotifications();
    await EasyLocalization.ensureInitialized();
    await _initAuthCredentials();
  }

  static  Future<void> _setOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _initBlocObserverAndHydratedBloc() async {
    Bloc.observer = AppBlocObserver();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }

  static Future<void> _initEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> _initServiceLocator() async {
    await setupServiceLocator();
  }

  static Future<void> _initPushNotifications() async {
    await getIt<PushNotificationsService>().init();
  }

  static Future<void> _initAuthCredentials() async {
    await getIt<AuthCredentialsHelper>().init();
  }
}

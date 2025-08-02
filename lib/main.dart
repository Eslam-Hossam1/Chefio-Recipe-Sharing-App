import 'package:chefio_app/chefio_app.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/services/notifications/push_notifications_service.dart';
import 'package:chefio_app/core/Localization/app_locals.dart';
import 'package:chefio_app/core/utils/app_bloc_observer.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await dotenv.load(fileName: ".env");
  await setupServiceLocator();
  await getIt<PushNotificationsService>().init();
  await EasyLocalization.ensureInitialized();
  await getIt<AuthCredentialsHelper>().init();
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: AppLocals.supportedLocales,
        path: "assets/translations",
        fallbackLocale: AppLocals.english,
        child: const Chefio(),
      ),
    ),
  );
}

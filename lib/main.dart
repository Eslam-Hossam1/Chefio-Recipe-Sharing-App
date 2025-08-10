import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'chefio_app.dart';
import 'core/config/app_initializer.dart';
import 'core/localization/app_locals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Run all initializations
  await AppInitializer.initialize();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
        supportedLocales: AppLocals.supportedLocales,
        path: "assets/translations",
        fallbackLocale: AppLocals.english,
        child: const Chefio(),
      ),
    ),
  );
}

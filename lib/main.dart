
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/app_themes.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await setupServiceLocator();
  await EasyLocalization.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ar')],
          path: "assets/translations",
          fallbackLocale: const Locale('en'),
          child: const Chefio()), // Wrap your app
    ),
  );
}

class Chefio extends StatelessWidget {
  const Chefio({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(Constants.kDesignWidth,
            Constants.kDesignHeight), // Design size, e.g., iPhone X dimensions
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            locale: context.locale, // Use EasyLocalization locale
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            builder: DevicePreview.appBuilder, // Wrap with DevicePreview
            theme: AppThemes.getDarkTheme(
                isArabic: context.locale == const Locale('ar')),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}

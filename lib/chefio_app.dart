import 'package:chefio_app/chefio_global_cubits_provider.dart';
import 'package:chefio_app/core/Functions/get_text_theme.dart';
import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/core/helpers/system_ui_helper.dart';
import 'package:chefio_app/core/routing/app_router.dart';
import 'package:chefio_app/core/services/notifications/push_notifications_service.dart';
import 'package:chefio_app/core/theme/app_themes.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChefioApp extends StatefulWidget {
  const ChefioApp({super.key});

  @override
  State<ChefioApp> createState() => _ChefioAppState();
}

class _ChefioAppState extends State<ChefioApp> {
  @override
  void initState() {
    super.initState();

    getIt<PushNotificationsService>().setupInteractedMessage();
    getIt<PushNotificationsService>().handleRefreshFcmToken();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(Constants.kDesignWidth, Constants.kDesignHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return ChefioGlobalCubitsProvider(
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, mode) {
                SystemUIHelper.setSystemUIForTheme(context, mode);
                return MaterialApp.router(
                  routerConfig: AppRouter.router,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  builder: DevicePreview.appBuilder,
                  //getting textTheme bassed on context cuz of using easy localization
                  // for localization to access current locale and get the textTheme bassed on it
                  themeMode: mode,
                  theme: AppThemes.lightTheme
                      .copyWith(textTheme: getTextTheme(context)),
                  darkTheme: AppThemes.darkTheme
                      .copyWith(textTheme: getTextTheme(context)),

                  debugShowCheckedModeBanner: false,
                );
              },
            ),
          );
        });
  }
}

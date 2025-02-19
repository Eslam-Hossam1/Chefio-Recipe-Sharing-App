import 'package:chefio_app/core/Functions/get_text_theme.dart';
import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/app_themes.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await dotenv.load(fileName: ".env");
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
        designSize: const Size(Constants.kDesignWidth, Constants.kDesignHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => ThemeCubit(),
            child: BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, mode) {
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

import 'package:chefio_app/core/Functions/get_text_theme.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/utils/theme/app_themes.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/services/like_recipe_service.dart';
import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chefio extends StatelessWidget {
  const Chefio({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(Constants.kDesignWidth, Constants.kDesignHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ThemeCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    LikeRecipeCubit(getIt<LikeRecipeService>()),
              ),
            ],
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
                  themeMode: ThemeMode.light,
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

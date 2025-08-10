import 'package:chefio_app/core/Functions/get_text_theme.dart';
import 'package:chefio_app/core/cubit/follow_chef/follow_chef_cubit.dart';
import 'package:chefio_app/core/cubit/like_recipe_cubit/like_recipe_cubit.dart';
import 'package:chefio_app/core/cubit/theme_cubit/theme_cubit.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/services/follow_chef_service.dart';
import 'package:chefio_app/core/services/like_recipe_service.dart';
import 'package:chefio_app/core/services/notifications/push_notifications_service.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/routing/app_router.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:chefio_app/core/theme/app_themes.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:chefio_app/features/profile/presentation/manager/chef_connections_cubit/chef_connections_cubit.dart';
import 'package:chefio_app/features/profile/presentation/manager/my_profile_cubit/my_profile_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chefio extends StatefulWidget {
  const Chefio({super.key});

  @override
  State<Chefio> createState() => _ChefioState();
}

class _ChefioState extends State<Chefio> {
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
          //this cubits used in multi parts in app and should be provided globally
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ThemeCubit(),
              ),
              BlocProvider(
                create: (context) =>
                    LikeRecipeCubit(getIt<LikeRecipeService>()),
              ),
              BlocProvider(
                create: (context) =>
                    ChefConnectionsCubit(profileRepo: getIt<ProfileRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => FollowChefCubit(
                    followChefService: getIt<FollowChefService>()),
              ),
              BlocProvider(
                create: (context) => MyProfileCubit(
                  profileRepo: getIt<ProfileRepoImpl>(),
                  authCredentialsHelper: getIt<AuthCredentialsHelper>(),
                ),
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

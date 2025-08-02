import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:chefio_app/core/routing/app_routes/all_routs.dart';
import 'package:chefio_app/core/routing/router_redirect.dart';
import 'package:chefio_app/core/routing/routs.dart';
import 'package:chefio_app/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final routerRedirect = RouterRedirect(
    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
    onBoardingCacheHelper: getIt<OnBoardingCacheHelper>(),
  );

  static final router = GoRouter(
    redirect: routerRedirect.redirect,
    initialLocation: RoutePaths.initialRoute,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}

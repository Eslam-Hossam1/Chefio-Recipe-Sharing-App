import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/core/utils/routing/app_routes/all_routs.dart';
import 'package:chefio_app/core/utils/routing/router_redirect.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final routerRedirect = RouterRedirect(
    authCredentialsHelper: getIt<AuthCredentialsHelper>(),
    sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
  );

  static final router = GoRouter(
    redirect: routerRedirect.redirect,
    initialLocation: RoutePaths.initialRoute,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}

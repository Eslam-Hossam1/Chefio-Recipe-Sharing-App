// file: lib/core/utils/routing/router_redirect.dart

import 'dart:developer';

import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/routing_helper.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterRedirect {
  final AuthCredentialsHelper _authCredentialsHelper;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  const RouterRedirect(
      {required AuthCredentialsHelper authCredentialsHelper,
      required SharedPreferencesHelper sharedPreferencesHelper})
      : _authCredentialsHelper = authCredentialsHelper,
        _sharedPreferencesHelper = sharedPreferencesHelper;

  String? redirect(BuildContext context, GoRouterState state) {
    logInfos(state);

    bool isAppJustOpenedNormally =
        state.matchedLocation == RoutePaths.initialRoute;

    if (isAppJustOpenedNormally) {
      return determineInitialView();
    } else {
      return handleAppOpenedFromDeepLink(state);
    }
  }

  void logInfos(GoRouterState state) {
    log('location: ${state.uri.path}');
    log('uri: ${state.uri}');
    log('pathSegments: ${state.uri.pathSegments}');
    log('queryParameters: ${state.uri.queryParameters}');
  }

  String determineInitialView() {
    if (!isOnBoardingCompleted()) {
      return RoutePaths.onboarding;
    } else {
      return _authCredentialsHelper.userIsAuthenticated()
          ? RoutePaths.home
          : RoutePaths.login;
    }
  }

  bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = _sharedPreferencesHelper.getBool(
      key: Constants.kIsOnBoardingCompletedKey,
    );
    return isOnBoardingCompleted ?? false;
  }

  String? handleAppOpenedFromDeepLink(GoRouterState state) {
    final isLoggedIn = _authCredentialsHelper.userIsAuthenticated();
    if (!isLoggedIn) {
      return RoutePaths.login;
    }
    if (state.uri.pathSegments.contains('recipes')) {
      final recipeId = state.uri.pathSegments.last;
      return RoutingHelper.getRecipeDetailsPath(recipeId: recipeId);
    }
    if (state.uri.pathSegments.contains('profile')) {
      final chefId = state.uri.pathSegments.last;
      return RoutingHelper.getProfilePath(chefId: chefId);
    }

    return null;
  }
}

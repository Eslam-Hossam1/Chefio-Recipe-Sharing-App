import 'dart:developer';

import 'package:chefio_app/core/utils/routing/app_router.dart';
import 'package:chefio_app/core/helpers/auth_credentials_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/routing/routs.dart';
import 'package:chefio_app/core/utils/cache/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel {
  final AuthCredentialsHelper authCredentialsHelper;
  SplashViewModel(this.authCredentialsHelper);
  String determineToGoView() {
    if (!isOnBoardingCompleted()) {
      return RoutePaths.onboarding;
    } else {
      return authCredentialsHelper.userIsAuthenticated()
          ? RoutePaths.home
          : RoutePaths.login;
    }
  }

  bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = getIt<SharedPreferencesHelper>()
        .getBool(key: Constants.kIsOnBoardingCompletedKey);
    return isOnBoardingCompleted == null ? false : true;
  }
}

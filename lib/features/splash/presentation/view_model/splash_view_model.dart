import 'dart:developer';

import 'package:chefio_app/core/Functions/check_user_logged_in.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewModel {
  Future<String> determineToGoView() async {
    if (!isOnBoardingCompleted()) {
      return AppRouter.kOnBoardingView;
    } else {
      return await checkUserLoggedIn() == true
          ? AppRouter.kHomeView
          : AppRouter.kLoginView;
    }
  }

  bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = getIt<SharedPreferencesHelper>()
        .getBool(key: Constants.kIsOnBoardingCompletedKey);
    return isOnBoardingCompleted == null ? false : true;
  }
}

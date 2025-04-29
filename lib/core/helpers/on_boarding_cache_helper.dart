import 'package:chefio_app/core/utils/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

abstract class OnBoardingCacheHelper {
  static Future<void> setOnBoardingCompletedToTrue(BuildContext context) async {
    await getIt<SharedPreferencesHelper>()
        .setData(key: Constants.kIsOnBoardingCompletedKey, value: true);
  }

  static bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = getIt<SharedPreferencesHelper>()
        .getBool(key: Constants.kIsOnBoardingCompletedKey);
    return isOnBoardingCompleted == null ? false : true;
  }
}

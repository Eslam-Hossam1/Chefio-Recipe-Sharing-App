import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/utils/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel {
  Future<void> setOnBoardingCompletedToTrue(BuildContext context) async {
    await getIt<SharedPreferencesHelper>()
        .setData(key: Constants.kIsOnBoardingCompletedKey, value: true);
  }
}

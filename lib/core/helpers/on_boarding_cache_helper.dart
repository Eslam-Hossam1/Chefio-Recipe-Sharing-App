import 'package:chefio_app/core/cache/shared_prefernce_helper.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingCacheHelper {
  final SharedPreferencesHelper _sharedPreferencesHelper;

  OnBoardingCacheHelper(
      {required SharedPreferencesHelper sharedPreferencesHelper})
      : _sharedPreferencesHelper = sharedPreferencesHelper;

  Future<void> setOnBoardingCompletedToTrue(BuildContext context) async {
    await _sharedPreferencesHelper.setData(
        key: Constants.kIsOnBoardingCompletedKey, value: true);
  }

  bool isOnBoardingCompleted() {
    bool? isOnBoardingCompleted = _sharedPreferencesHelper.getBool(
        key: Constants.kIsOnBoardingCompletedKey);
    return isOnBoardingCompleted == null ? false : true;
  }
}

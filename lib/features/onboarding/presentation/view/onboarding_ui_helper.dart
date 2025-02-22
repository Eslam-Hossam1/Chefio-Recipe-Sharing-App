import 'package:chefio_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class OnboardingUIHelper {
  static double getDishResponsiveSizeDividedByTwo(double baseWidth, context) {
    double dishResponsiveSize =
        getDishResponsiveSize(context, baseDishWidth: baseWidth);
    return dishResponsiveSize / 2;
  }

  static double getDishResponsiveSize(BuildContext context,
      {required double baseDishWidth}) {
    double upperLimit = baseDishWidth * 4;
    double lowerLimit = baseDishWidth * 0.75;
    double dishResponsiveSize = baseDishWidth *
        (MediaQuery.sizeOf(context).width / Constants.kDesignWidth);
    return dishResponsiveSize.clamp(lowerLimit, upperLimit);
  }

  static double dishSizeScalingRatio(BuildContext context,
      {required double baseDishWidth}) {
    return (OnboardingUIHelper.getDishResponsiveSize(context,
            baseDishWidth: baseDishWidth) /
        baseDishWidth);
  }

  static const double centerDishSize = 140;
  static const double centerRightDishSize = 72;
  static const double centerLeftDishSize = 104;
  static const double topRightDishSize = 104;
  static const double topLeftDishSize = 88;
  static const double bottomLeftDishSize = 72;
  static const double bottomDishSize = 88;
  static const double bottomRightDishSize = 56;
}

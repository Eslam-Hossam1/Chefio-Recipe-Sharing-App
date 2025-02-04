import 'package:chefio_app/core/utils/assets.dart';
import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/features/onboarding/presentation/view/onboarding_ui_helper.dart';
import 'package:chefio_app/features/onboarding/presentation/view/widgets/dish_image.dart';
import 'package:flutter/material.dart';

class OnBourdingDishesSectionMobile extends StatelessWidget {
  const OnBourdingDishesSectionMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double stackWidth = MediaQuery.of(context).size.width;
    double stackHeight = MediaQuery.of(context).size.height / 2;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Center Plate
        Positioned(
          top: stackHeight * 0.5 -
              OnboardingUIHelper.getDishResponsiveSizeDividedByTwo(
                  OnboardingUIHelper.centerDishSize, context),
          left: stackWidth * 0.5 -
              OnboardingUIHelper.getDishResponsiveSizeDividedByTwo(
                  OnboardingUIHelper.centerDishSize, context),
          child: DishImage(
            assetPath: Assets.imagesCenterDish,
            size: OnboardingUIHelper.centerDishSize,
          ),
        ),

        // Center Right
        Positioned(
          top: stackHeight * 0.5 -
              OnboardingUIHelper.getDishResponsiveSize(context,
                  baseDishWidth: OnboardingUIHelper.centerRightDishSize),
          right: -30 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.centerRightDishSize),
          child: DishImage(
            assetPath: Assets.imagesCenterRightDish,
            size: OnboardingUIHelper.centerRightDishSize,
          ),
        ),

        // center point of the stack - half of dish size
        // the left position due to the stack * the ration of increase or decrease in size
        Positioned(
          top: stackHeight * 0.5 -
              OnboardingUIHelper.getDishResponsiveSizeDividedByTwo(
                  OnboardingUIHelper.centerLeftDishSize, context) +
              32,
          left: -33 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.centerLeftDishSize),
          child: DishImage(
            assetPath: Assets.imagesCenterLeftDish,
            size: OnboardingUIHelper.centerLeftDishSize,
          ),
        ),

        // Top Right
        Positioned(
          top: 0,
          right: 40 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.topRightDishSize),
          child: DishImage(
            assetPath: Assets.imagesTopRightDish,
            size: OnboardingUIHelper.topRightDishSize,
          ),
        ),

        // Top Left
        Positioned(
          top: 20 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.topLeftDishSize),
          left: 23 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.topLeftDishSize),
          child: DishImage(
            assetPath: Assets.imagesTopLeftDish,
            size: OnboardingUIHelper.topLeftDishSize,
          ),
        ),

        // Bottom Left
        Positioned(
          bottom: -8 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomLeftDishSize),
          left: 40 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomLeftDishSize),
          child: DishImage(
            assetPath: Assets.imagesBottomLeftDish,
            size: OnboardingUIHelper.bottomLeftDishSize,
          ),
        ),

        // Bottom
        Positioned(
          bottom: -20 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomDishSize),
          right: 80 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomDishSize),
          child: DishImage(
            assetPath: Assets.imagesBottomDish,
            size: OnboardingUIHelper.bottomDishSize,
          ),
        ),

        // Bottom Right
        Positioned(
          bottom: 60 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomRightDishSize),
          right: 30 *
              OnboardingUIHelper.dishSizeScalingRatio(context,
                  baseDishWidth: OnboardingUIHelper.bottomRightDishSize),
          child: DishImage(
            assetPath: Assets.imagesBottomRightDish,
            size: OnboardingUIHelper.bottomRightDishSize,
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item.dart';
import 'package:flutter/material.dart';

class ProfileLikedRecipesGrid extends StatelessWidget {
  const ProfileLikedRecipesGrid({
    super.key,
    required this.recipes,
  });

  final List<RecipeEntity> recipes;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final bool isBigMobile =
        width >= 420 && width < SizeConfig.tabletBreakPoint;
    final bool isMobile = width >= 330 && width < 420;
    final bool isSmallMobile = width < 330;
    final bool isSmallTablet =
        width >= SizeConfig.tabletBreakPoint && width < 650;
    final bool isTablet = width >= 650 && width < 1000;
    final bool isBigTablet = width >= 1000 && width < 1300;
    final bool isDesktop = width >= 1300;

    // نتحكم في maxCrossAxisExtent حسب حجم الشاشة
    double maxCrossAxisExtent;
    if (isSmallMobile) {
      maxCrossAxisExtent = 220;
    } else if (isMobile) {
      maxCrossAxisExtent = 200;
    } else if (isBigMobile) {
      maxCrossAxisExtent = 240;
    } else if (isSmallTablet) {
      maxCrossAxisExtent = 215;
    } else if (isTablet) {
      maxCrossAxisExtent = 215;
    } else if (isBigTablet) {
      maxCrossAxisExtent = 250;
    } else {
      maxCrossAxisExtent = 300;
    }

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: isMobile
            ? 0.502
            : isBigMobile
                ? .54
                : isSmallTablet
                    ? .527
                    : isTablet
                        ? .53
                        : isBigTablet
                            ? .56
                            : isDesktop
                                ? .60
                                : 0.54,
        crossAxisSpacing: width > SizeConfig.tabletBreakPoint ? 24 : 16,
        mainAxisSpacing: width < 550 ? 8 : 16,
      ),
      itemBuilder: (context, index) {
        return RecipeItem(recipeEntity: recipes[index]);
      },
      itemCount: recipes.length,
    );
  }
}

import 'dart:developer';

import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item_body.dart';
import 'package:flutter/material.dart';

class SkeletonizerProfileRecipesGridView extends StatelessWidget {
  const SkeletonizerProfileRecipesGridView({
    super.key,
    required this.recipes,
  });

  final List<RecipeBodyEntity> recipes;

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
      maxCrossAxisExtent = 180.84;
    } else if (isMobile) {
      maxCrossAxisExtent = 180.4;
    } else if (isBigMobile) {
      maxCrossAxisExtent = 240;
    } else if (isSmallTablet) {
      maxCrossAxisExtent = 176.73;
    } else if (isTablet) {
      maxCrossAxisExtent = 170;
    } else if (isBigTablet) {
      maxCrossAxisExtent = 205.5;
    } else {
      maxCrossAxisExtent = 246.6;
    }

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        childAspectRatio: isMobile
            //هنا
            ? 0.591
            : isBigMobile
                ? .64
                : isSmallTablet
                    ? .620806
                    : isTablet
                        ? 0.60
                        : isBigTablet
                            ? .6188
                            : isDesktop
                                ? .6788
                                : 0.60,
        crossAxisSpacing: width > SizeConfig.tabletBreakPoint ? 24 : 16,
        mainAxisSpacing: width < 550 ? 8 : 16,
      ),
      itemBuilder: (context, index) {
        return RecipeItemBody(recipeBodyEntity: recipes[index]);
      },
      itemCount: recipes.length,
    );
  }
}

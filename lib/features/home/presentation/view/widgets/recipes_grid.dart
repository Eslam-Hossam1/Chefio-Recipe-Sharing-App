import 'package:chefio_app/core/utils/constants.dart';
import 'package:chefio_app/core/utils/size_config.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/recipe_item.dart';
import 'package:flutter/material.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isMobile = width < SizeConfig.tabletBreakPoint;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isMobile ? 2 : 3,
          childAspectRatio: isMobile ? 0.500 : 0.560,
          crossAxisSpacing: 25,
          mainAxisSpacing: 32),
      itemBuilder: (context, index) {
        return RecipeItem();
      },
    );
  }
}

import 'package:chefio_app/features/home/data/models/recipe_model/recipe_model.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverSkeletonizerRecipesGrid extends StatelessWidget {
  const SliverSkeletonizerRecipesGrid({
    super.key,
  });

  static List<RecipeModel> recipes =
      List.generate(12, (index) => RecipeModel(title: "Eslam Hossam"),);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SliverRecipesGrid(recipes: recipes),
    );
  }
}
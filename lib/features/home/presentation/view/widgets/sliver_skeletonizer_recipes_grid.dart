import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverSkeletonizerRecipesGrid extends StatelessWidget {
  const SliverSkeletonizerRecipesGrid({
    super.key,
  });

  static List<Recipe> recipes = List.generate(
    12,
    (index) => Recipe(foodName: "Eslam Hossam",category: Category(name: 'test category')),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SliverRecipesGrid(recipes: recipes),
    );
  }
}

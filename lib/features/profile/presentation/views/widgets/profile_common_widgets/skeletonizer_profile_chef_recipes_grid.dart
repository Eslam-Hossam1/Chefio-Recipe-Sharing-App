import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/home/presentation/view/widgets/sliver_recipes_grid.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/profile_chef_recipes_grid.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerProfileChefRecipesGrid extends StatelessWidget {
  const SkeletonizerProfileChefRecipesGrid({
    super.key,
  });

  static List<RecipeEntity> recipes = List.generate(
    12,
    (index) => RecipeEntity(
      recipeName: "Pasta Pasta",
      recipeCategory: Category(name: 'test category', id: ''),
      recipeIsLiked: false,
      chefId: '',
      chefUsername: 'Eslam Hossam',
      recipeId: '',
      recipeImageUrl: '',
      recipeCookingDuration: 45,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ProfileChefRecipesGrid(recipes: recipes),
    );
  }
}

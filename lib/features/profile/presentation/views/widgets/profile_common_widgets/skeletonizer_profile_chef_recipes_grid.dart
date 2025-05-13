import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/profile/presentation/views/widgets/profile_common_widgets/skeletonizer_profile_recipes_grid_view.dart';
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
      recipeImageUrl:
          'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
      recipeCookingDuration: 45,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      enabled: true,
      child: SkeletonizerProfileRecipesGridView(recipes: recipes),
    );
  }
}

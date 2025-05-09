import 'package:chefio_app/core/Entities/recipe_body_entity.dart';

class RecipeEntity extends RecipeBodyEntity {
  final String chefUsername;
  final String chefId;
  final String? chefImageUrl;
  RecipeEntity(
      {required this.chefUsername,
      required this.chefId,
      this.chefImageUrl,
      required super.recipeId,
      required super.recipeName,
      required super.recipeImageUrl,
      required super.recipeCookingDuration,
      required super.recipeCategory,
      required super.recipeIsLiked});
}

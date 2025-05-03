
import 'package:chefio_app/core/models/category.dart';

class RecipeBodyEntity {
  final String recipeId;
  final String recipeName;
  final String recipeImageUrl;
  bool recipeIsLiked;
  final int recipeCookingDuration;
  final Category recipeCategory;

  RecipeBodyEntity({
    required this.recipeId,
    required this.recipeName,
    required this.recipeImageUrl,
    required this.recipeCookingDuration,
    required this.recipeCategory,
    required this.recipeIsLiked,
  });
}

import 'package:flutter/foundation.dart';

class ProfileRecipeEntity {
  final String recipeId;
  final String recipeName;
  final String recipeImageUrl;
  bool recipeIsLiked;
  final String? chefUsername;
  final String? chefId;
  final String? chefImageUrl;
  final int recipeCookingDuration;
  final Category category;

  ProfileRecipeEntity({
    required this.recipeId,
    required this.recipeName,
    required this.recipeImageUrl,
    required this.chefUsername,
    required this.chefId,
    required this.chefImageUrl,
    required this.recipeCookingDuration,
    required this.category,
    required this.recipeIsLiked,
  });
}

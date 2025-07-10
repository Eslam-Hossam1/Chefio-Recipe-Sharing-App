import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_liker_model/recipe_liker_model.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeDetailsRepo {
  Future<Either<ApiFailure, RecipeDetailsModel>> fetchRecipeDetails(
      {required String recipeId});
  Future<Either<ApiFailure, List<RecipeLikerModel>>> fetchRecipeLikers(
      {required String recipeId});
  Future<Either<ApiFailure, void>> deleteRecipe({required String recipeId});
}

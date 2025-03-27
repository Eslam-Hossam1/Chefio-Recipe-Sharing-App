import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeDetailsRepo {
  Future<Either<ApiFailure, RecipeDetailModel>> fetchRecipeDetails({required String recipeId});
}
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRecipeRepo {
  Future<Either<ApiFailure, List<RecipeEntity>>> searchRecipe({
    required String searchRecipeName,
    required int limit,
    required int page,
  });
}

import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRecipeRepo {
  Future<Either<ApiFailure, List<Recipe>>> searchRecipe({
    required String searchRecipeName,
    required int limit,
    required int page,
  });
}

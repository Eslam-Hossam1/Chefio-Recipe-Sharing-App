import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/failures.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart'
    hide RecipeEntity;
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApiFailure, List<RecipeEntity>>> fetchRecipesFromApi(
      {required String categoryName, required int limit, required int page});
  Future<Either<ApiFailure, List<Category>>> fetchCategories();
}

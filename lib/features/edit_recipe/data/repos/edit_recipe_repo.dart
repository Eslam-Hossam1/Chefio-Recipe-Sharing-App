import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:dartz/dartz.dart';

abstract class EditRecipeRepo {
  List<Category> fetchCategories();
  Future<Either<ApiFailure, void>> editRecipe(
      {required EditRecipeModel editRecipeModel});
}

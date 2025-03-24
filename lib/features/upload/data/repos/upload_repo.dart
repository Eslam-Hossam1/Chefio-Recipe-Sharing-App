import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/upload/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:dartz/dartz.dart';

abstract class UploadRepo{
    Future<Either<ApiFailure,void>> uploadRecipe({required UploadRecipeModel uploadRecipeModel});
    Future<Either<ApiFailure, List<Category>>> fetchCategories();
    Future<Either<ApiFailure,void>> editRecipe({required EditRecipeModel editRecipeModel});

}
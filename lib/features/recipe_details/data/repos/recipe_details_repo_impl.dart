import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_detail_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RecipeDetailsRepoImpl implements RecipeDetailsRepo {
  final ApiConsumer _apiConsumer;

  RecipeDetailsRepoImpl(this._apiConsumer);

  @override
  Future<Either<ApiFailure, RecipeDetailModel>> fetchRecipeDetails(
      {required String recipeId}) async {
    try {
      var response =
          await _apiConsumer.get(EndPoints.getRecipeDetailsEndPoint(recipeId));
      //parse here
      return Right(RecipeDetailModel(
          imageUrl:
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          id: 'lolololololololool',
          foodName: 'foodName',
          foodDescription: 'foodDescription',
          foodCookDuration: 1,
          categoryName: 'categoryName',
          ingredients: ['ingredient1', 'ingredient2'],
          steps: ['step1', 'step2']));
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}

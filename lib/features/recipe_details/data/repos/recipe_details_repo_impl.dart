import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_model.dart';
import 'package:chefio_app/features/recipe_details/data/models/recipe_details_success/recipe_details_api_success_model.dart';
import 'package:chefio_app/features/recipe_details/data/repos/recipe_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RecipeDetailsRepoImpl implements RecipeDetailsRepo {
  final ApiConsumer _apiConsumer;

  RecipeDetailsRepoImpl(this._apiConsumer);

  @override
  Future<Either<ApiFailure, RecipeDetailsModel>> fetchRecipeDetails(
      {required String recipeId}) async {
    try {
      var response =
          await _apiConsumer.get(EndPoints.getRecipeDetailsEndPoint(recipeId));
      RecipeDetailsModel recipeDetailsModel =
          RecipeDetailsApiSuccessModel.fromJson(response).recipeDetailsModel;
      return Right(recipeDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        log(e.toString());
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}

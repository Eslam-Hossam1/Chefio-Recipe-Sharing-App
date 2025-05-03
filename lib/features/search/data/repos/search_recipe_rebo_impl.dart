import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/home_success_model.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/search/data/repos/search_recipe_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRecipeRepoImpl implements SearchRecipeRepo {
  final ApiConsumer _apiConsumer;
  SearchRecipeRepoImpl(
    this._apiConsumer,
  );
  @override
  Future<Either<ApiFailure, List<RecipeEntity>>> searchRecipe({
    required String searchRecipeName,
    required int limit,
    required int page,
  }) async {
    try {
      final response =
          await _apiConsumer.get(EndPoints.recipes, queryParameters: {
        ApiKeys.limit: limit,
        ApiKeys.page: page,
        ApiKeys.search: searchRecipeName,
      });
      final List<RecipeModel> recipes =
          HomeSuccessModel.fromJson(response).recipes!;
      return Right(recipes);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}

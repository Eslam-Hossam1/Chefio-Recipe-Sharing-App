import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/home/data/models/recipe_model/recipe_model.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer _apiConsumer;
  HomeRepoImpl(this._apiConsumer);
  @override
  Future<Either<DioApiFailure, List<RecipeModel>>> fetchRecipesFromApi(
      {required String categoryName,required int limit, required int skip}) async {
    try {
      final response = await _apiConsumer.get(EndPoints.home, queryParameters: {
        ApiKeys.limit: limit,
        ApiKeys.skip: skip,
      });
      List<dynamic> products = response['products'];
      final List<RecipeModel> recipes = products
          .map(
            (recipeJson) => RecipeModel.fromJson(recipeJson),
          )
          .toList();

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

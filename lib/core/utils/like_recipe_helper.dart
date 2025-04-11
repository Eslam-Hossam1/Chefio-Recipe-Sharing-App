import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LikeRecipeHelper {
  final ApiConsumer _apiConsumer;
  LikeRecipeHelper({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  Future<Either<ApiFailure, void>> likeRecipe(
      {required String recipeId}) async {
    try {
      var result =
          await _apiConsumer.patch(EndPoints.getLikeRecipeEndPoint(recipeId));
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return left(DioApiFailure.fromDioException(e));
      }else{
        return left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}

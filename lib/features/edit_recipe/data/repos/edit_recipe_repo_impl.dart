import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/edit_recipe/data/repos/edit_recipe_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditRecipeRepoImpl implements EditRecipeRepo {
  final ApiConsumer _apiConsumer;

  EditRecipeRepoImpl(
    this._apiConsumer,
  );

  @override
  Future<Either<ApiFailure, void>> editRecipe(
      {required EditRecipeModel editRecipeModel}) async {
    try {
      await _apiConsumer.patch(
        EndPoints.getEditRecipeEndPoint(editRecipeModel.id),
        data: editRecipeModel.toJson(),
        isFromData: true,
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }
}

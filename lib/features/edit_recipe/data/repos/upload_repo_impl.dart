import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/features/edit_recipe/data/models/edit_recipe_model.dart';
import 'package:chefio_app/features/upload/data/models/upload_recipe_model.dart';
import 'package:chefio_app/features/upload/data/repos/upload_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UploadRepoImpl implements UploadRepo {
  final ApiConsumer _apiConsumer;
  final CategoriesService _categoriesService;

  UploadRepoImpl(this._apiConsumer, this._categoriesService);

  @override
  Future<Either<ApiFailure, void>> uploadRecipe(
      {required UploadRecipeModel uploadRecipeModel}) async {
    log('uploadRecipeModel: ${uploadRecipeModel.toJson()}');
    try {
      await _apiConsumer.post(EndPoints.uploadRecipe,
          data: uploadRecipeModel.toJson(), isFromData: true);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiFailure, List<Category>>> fetchCategories() async {
    try {
      return Right(await _categoriesService.getCategories());
    } catch (e) {
      if (e is DioException) {
        return Left(DioApiFailure.fromDioException(e));
      } else {
        return Left(DioApiFailure.unknown(e.toString()));
      }
    }
  }

  @override
  Future<Either<ApiFailure, void>> editRecipe(
      {required EditRecipeModel editRecipeModel}) async {
    log('uploadRecipeModel: ${editRecipeModel.toJson()}');

    try {
      await _apiConsumer.patch(
          EndPoints.getEditRecipeEndPoint(editRecipeModel.id),
          data: editRecipeModel.toJson(),
          isFromData: true);
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

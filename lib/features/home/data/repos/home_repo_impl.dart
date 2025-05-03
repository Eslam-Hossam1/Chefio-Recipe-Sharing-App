import 'dart:developer';

import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/dio_consumer.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/core/utils/Localization/app_localization_keys/app_localization_keys.dart';
import 'package:chefio_app/core/services/categories_service.dart';
import 'package:chefio_app/core/models/category.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/home_success_model.dart';
import 'package:chefio_app/features/home/data/models/home_success_model/recipe_model.dart';
import 'package:chefio_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer _apiConsumer;
  final CategoriesService _categoriesService;
  HomeRepoImpl(this._apiConsumer, this._categoriesService);
  @override
  Future<Either<DioApiFailure, List<RecipeEntity>>> fetchRecipesFromApi(
      {required String categoryName,
      required int limit,
      required int page}) async {
    try {
      final response =
          await _apiConsumer.get(EndPoints.recipes, queryParameters: {
        ApiKeys.limit: limit,
        ApiKeys.page: page,
        ApiKeys.category: categoryName,
      });
      final List<RecipeEntity> recipes =
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

  @override
  Future<Either<ApiFailure, List<Category>>> fetchCategories() async {
    try {
      List<Category> categories = [];
      //add All category 'means when clicked dont specify category'
      categories.add(
        Category(
          id: '',
          name: '',
          categoryLocalizationKey: AppLocalizationKeys.global.all,
        ),
      );
      //add categories from api
      categories.addAll(await _categoriesService.getCategories());

      return Right(categories);
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

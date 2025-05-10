import 'dart:developer';

import 'package:chefio_app/core/Entities/recipe_body_entity.dart';
import 'package:chefio_app/core/Entities/recipe_entity.dart';
import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/profile/data/Entities/chef_connection_entity.dart';
import 'package:chefio_app/features/profile/data/models/chef_follower_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_following_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_liked_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer _apiConsumer;

  ProfileRepoImpl({
    required ApiConsumer apiConsumer,
  }) : _apiConsumer = apiConsumer;
  @override
  Future<Either<DioApiFailure, List<RecipeEntity>>> fetchChefLikedRecipes({
    required String chefId,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefLikedRecipesEndpoint(chefId),
        queryParameters: {
          ApiKeys.profilePage: page,
          ApiKeys.profileLimit: limit,
        },
      );
      List<RecipeEntity> chefRecipes = getProfileChefLikedRecipesFromResponse(
        response,
      );
      return Right(chefRecipes);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<DioApiFailure, List<RecipeBodyEntity>>> fetchChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefRecipesEndpoint(chefId),
        queryParameters: {
          ApiKeys.profilePage: page,
          ApiKeys.profileLimit: limit,
        },
      );
      List<RecipeBodyEntity> chefRecipes = getProfileChefRecipesFromResponse(
        response,
      );
      return Right(chefRecipes);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<DioApiFailure, ProfileModel>>
      fetchProfileWithInitialChefRecipes({
    required String chefId,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefProfileEndpoint(chefId),
        queryParameters: {
          ApiKeys.profilePage: page,
          ApiKeys.profileLimit: limit,
        },
      );
      ProfileModel profileModel = ProfileModel.fromJson(response);
      return Right(profileModel);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<DioApiFailure, List<ChefConnectionEntity>>> fetchChefFollowings({
    required String chefId,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefFollowingEndpoint(
          chefId,
        ),
      );
      List<ChefConnectionEntity> chefFollowings =
          getFollowingsFromResponse(response);
      return Right(chefFollowings);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<DioApiFailure, List<ChefConnectionEntity>>> fetchChefFollowers({
    required String chefId,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefFollowersEndpoint(
          chefId,
        ),
      );
      List<ChefConnectionEntity> chefFollowers =
          getFollowersFromResponse(response);
      return Right(chefFollowers);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  DioApiFailure handleException(Object e) {
    if (e is DioException) {
      return DioApiFailure.fromDioException(
        e,
      );
    } else {
      log(e.toString());
      return DioApiFailure.unknown(
        e.toString(),
      );
    }
  }

  List<RecipeBodyEntity> getProfileChefRecipesFromResponse(response) {
    List<RecipeBodyEntity> profileChefRecipesList =
        (response[ApiKeys.recipes][ApiKeys.data] as List)
            .map((e) => ChefProfileRecipeModel.fromJson(e))
            .toList();
    return profileChefRecipesList;
  }

  List<RecipeEntity> getProfileChefLikedRecipesFromResponse(response) {
    List<RecipeEntity> profileChefLikedRecipesList =
        (response[ApiKeys.recipes][ApiKeys.data] as List)
            .map((e) => ChefLikedRecipeModel.fromJson(e))
            .toList();
    return profileChefLikedRecipesList;
  }

  List<ChefConnectionEntity> getFollowingsFromResponse(response) {
    List<ChefConnectionEntity> chefFollowings =
        (response[ApiKeys.following] as List)
            .map((e) => ChefFollowingModel.fromJson(e))
            .toList();
    return chefFollowings;
  }

  List<ChefConnectionEntity> getFollowersFromResponse(response) {
    List<ChefConnectionEntity> chefFollowers =
        (response[ApiKeys.followers] as List)
            .map((e) => ChefFollowerModel.fromJson(e))
            .toList();
    return chefFollowers;
  }
}

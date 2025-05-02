import 'dart:developer';

import 'package:chefio_app/core/api/api_consumer.dart';
import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/core/errors/dio_api_failure.dart';
import 'package:chefio_app/features/profile/data/models/chef_follower_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_following_model.dart';

import 'package:chefio_app/features/profile/data/models/profile_chef_liked_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_chef_recipe_model.dart';
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
  Future<Either<ApiFailure, List<ProfileChefLikedRecipeModel>>>
      fetchChefLikedRecipes({
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
      List<ProfileChefLikedRecipeModel> chefRecipes =
          getProfileChefLikedRecipesFromResponse(
        response,
      );
      return Right(chefRecipes);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<ProfileChefRecipeModel>>> fetchChefRecipes({
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
      List<ProfileChefRecipeModel> chefRecipes = getProfileChefRecipesFromResponse(
        response,
      );
      return Right(chefRecipes);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ApiFailure, ProfileModel>> fetchProfileWithInitialChefRecipes({
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
  Future<Either<ApiFailure, List<ChefFollowingModel>>> fetchChefFollowings({
    required String chefId,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefFollowingEndpoint(
          chefId,
        ),
      );
      List<ChefFollowingModel> chefFollowings =
          getFollowingsFromResponse(response);
      return Right(chefFollowings);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<ChefFollowerModel>>> fetchChefFollowers({
    required String chefId,
  }) async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.getChefFollowersEndpoint(
          chefId,
        ),
      );
      List<ChefFollowerModel> chefFollowers =
          getFollowersFromResponse(response);
      return Right(chefFollowers);
    } catch (e) {
      return Left(handleException(e));
    }
  }

  ApiFailure handleException(Object e) {
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

  
  List<ProfileChefRecipeModel> getProfileChefRecipesFromResponse(response) {
    List<ProfileChefRecipeModel> profileChefRecipesList =
        (response[ApiKeys.recipes] as List)
            .map((e) => ProfileChefRecipeModel.fromJson(e))
            .toList();
    return profileChefRecipesList;
  }

  List<ProfileChefLikedRecipeModel> getProfileChefLikedRecipesFromResponse(response) {
    List<ProfileChefLikedRecipeModel> profileChefLikedRecipesList =
        (response[ApiKeys.recipes] as List)
            .map((e) => ProfileChefLikedRecipeModel.fromJson(e))
            .toList();
    return profileChefLikedRecipesList;
  }

  List<ChefFollowingModel> getFollowingsFromResponse(response) {
    List<ChefFollowingModel> chefFollowings =
        (response as List).map((e) => ChefFollowingModel.fromJson(e)).toList();
    return chefFollowings;
  }

  List<ChefFollowerModel> getFollowersFromResponse(response) {
    List<ChefFollowerModel> chefFollowers =
        (response as List).map((e) => ChefFollowerModel.fromJson(e)).toList();
    return chefFollowers;
  }
}
